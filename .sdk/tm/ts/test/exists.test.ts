
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { VoxgigOpenapiSpecSDK } from '..'


describe('exists', async () => {

  test('test-mode', () => {
    const testsdk = VoxgigOpenapiSpecSDK.test()
    equal(testsdk instanceof VoxgigOpenapiSpecSDK, true,
      'VoxgigOpenapiSpecSDK.test() must return a client synchronously')
  })

})
