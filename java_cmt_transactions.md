Java CMT Transaction Demarcation
=======================

key             | description
----------      | --------------
REQUIRED      | `This is the default transaction attribute value. Upon entering the method, the container interposes to create a new transaction context if one is not already available. If the container created a transaction upon entering the method, it commits that transaction when the method call completes.`
MANDATORY     | `A transaction must be in effect at the time the method is called.`
REQUIRES_NEW  | `The container always creates a new transaction before executing a method thusly marked.`
SUPPORTS      | `This option is basically a no-op, resulting in no additional work by the container. If a transaction context is available it is used by the method. If no transaction context is available, then the container invokes the method with no transaction context.`
NOT_SUPPORTED | `The container invokes the method with an unspecified transaction context.`
NEVER         | `The method must not be involked with a transaction context.`
