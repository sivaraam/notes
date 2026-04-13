# Session 19 - Pub Sub

- Publish subscriber model is natively supported by Redis.

## Commands

- PUBLISH - `PUBLISH my_channel <message>
- SUBSCRIBE - `SUBSCRIBE my_channel`
- PSUBSCRIBE - similar to subscribe but allows subscribing to a
  set of channels matching a pattern.
  `PPUBLISH news.*`

## Use cases

- Publish subscribe is useful for event driven architecture
  use cases. A microservice may publish an even which other
  microservices listen to.

## Other notes

- Streams is a related but different concept in Redis. It supports
  persistence while publish-subscribe does not.
