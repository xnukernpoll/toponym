


type address = Ipaddr.t * int

type path = Fpath.t 
type endpoints = Pending | Bound of address list | Neg



module type S = sig
  type +'a stream

  type resolver = {
    scheme: string;
    resolve_fn: string list -> endpoints stream 
  }




  type resolve_fn = (Fpath.t list -> endpoints stream)

  val make: scheme:string -> resolve_fn:Fpath.t -> resolver
  val scheme: resolver -> string
  
  val resolve: resolver -> Fpath.t -> endpoints stream
  
end








