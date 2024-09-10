Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4D18EFE2
	for <llvm@lists.linux.dev>; Tue, 10 Sep 2024 15:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725983249; cv=none; b=VZdrDl6j4GUtPZjeC7rqGaVMrTbJEtLj25AjAgj8WW4wi8JmNiK4L0tIZmOI/wjMuBfUUeNdIen9NPTOEAy6aG95/Gg00JOB3DhwNplBNHOmJzaACb0qTHMq4weP0J9onQW6bVC3oAJSHX5Kd019XG+VOz/WB0oEceAvnFMyml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725983249; c=relaxed/simple;
	bh=9A/APuIFGbPcjtMuif9E61/EuFBRhAupcL3vrTGeB0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THJPNXyGuS63uhPTZ7WMCOA2uD11pZmzVhHpxVCD4FvisJm60Hea0C/b2lLpwUIVbPnaXjDN1yTEIIIM2KPx/WPmkcVxX+qcDji6jptgTx4bQb/rfHecEQnfhe3afnjdsXQfiQ1TpAQZ0IjmbtWo8lQY/mpi42aUUm7iCXcmwbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CfYCKmYw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CfYCKmYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725983246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xI90LOjhaSKmwdCVrm2T+2BRQEu4ErqAH0YU6FpnSNI=;
	b=CfYCKmYwk3m2TZsHSqhfSjLmzcDWkoKLr/OQECofYjaR/Klghg5CDFFogKB6/G+YqKUuzp
	CCl9iS4j9NSpCIFrVzeRsoEluhgUAAibeHNA8YztiriVCc6qzJfqYDU1PP9PAyGasbqlPQ
	nczQmjhdvDk4+DwucdqRnpZyp6kbQ4o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-127-P9hzo-mhMsaG2xMFCmT_ug-1; Tue,
 10 Sep 2024 11:47:22 -0400
X-MC-Unique: P9hzo-mhMsaG2xMFCmT_ug-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 953DE1955D4B;
	Tue, 10 Sep 2024 15:47:20 +0000 (UTC)
Received: from [10.2.16.203] (unknown [10.2.16.203])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 47293195605A;
	Tue, 10 Sep 2024 15:47:18 +0000 (UTC)
Message-ID: <5142d007-dc8b-4eea-b708-4ec2df08f90a@redhat.com>
Date: Tue, 10 Sep 2024 11:47:17 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] locking/rwsem: Move is_rwsem_reader_owned() and
 rwsem_owner() under CONFIG_DEBUG_RWSEMS
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will.deacon@arm.com>, Boqun Feng <boqun.feng@gmail.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
References: <20240909182905.161156-1-longman@redhat.com>
 <ZuAAOmjTGYEFQJPC@smile.fi.intel.com> <ZuAAbi7hRWz2DUte@smile.fi.intel.com>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <ZuAAbi7hRWz2DUte@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40


On 9/10/24 04:16, Andy Shevchenko wrote:
> On Tue, Sep 10, 2024 at 11:15:54AM +0300, Andy Shevchenko wrote:
>> On Mon, Sep 09, 2024 at 02:29:05PM -0400, Waiman Long wrote:
>>> Both is_rwsem_reader_owned() and rwsem_owner() are currently only used when
>>> CONFIG_DEBUG_RWSEMS is defined. This causes a compilation error with clang
>>> when `make W=1` and CONFIG_WERROR=y:
>>>
>>> kernel/locking/rwsem.c:187:20: error: unused function 'is_rwsem_reader_owned' [-Werror,-Wunused-function]
>>>    187 | static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
>>>        |                    ^~~~~~~~~~~~~~~~~~~~~
>>> kernel/locking/rwsem.c:271:35: error: unused function 'rwsem_owner' [-Werror,-Wunused-function]
>>>    271 | static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
>>>        |                                   ^~~~~~~~~~~
>>>
>>> Fix this by moving these two functions under the CONFIG_DEBUG_RWSEMS define.
>> At least this solves my issue,
>> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ...and
>
> Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for the testing.

No functional change is intended for this patch. Ingo & Peter, can this 
patch lands in v6.12 or has to wait until v6.13?

Thanks,
Longman

