Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1904E1AE875
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736367731; cv=none; b=k0snxwvfudyrmeBtUfDooDr11LEUVQtHZy3NfRKdjvNZheoXNf2gabZ7jJOvoe5ccfuh43pqCkHTt+ae8ErrDIg79c1OjNvHpD67OgM1+TBiSuCA9B0jxke8NHTolvnQWVaxjOxyss6PE0qIrUovBLRhTn17seKNxWjNKXKjbjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736367731; c=relaxed/simple;
	bh=604ND5SMZDy8f6XHY+BJxliTRQS6neEfKyfIUD7/LUc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fGm1P0jeyxJpn7GZHmLpICM2rG/RGfST8NTZ4pvWZSo6fqvWVJP/GXEVmSlNSUqLl+jmGBqCqwUSzbKVEN8uDxXNnYYCXKWtu7uChgICAkpOjtjn1nFJL9w1mUsh+YE0sxroO+R+JDI3pGsc40gVc/dJRg3XuPxOdPYmq7vzIIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U5ZR0Myg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U5ZR0Myg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736367728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y6xr6c4SzMqA5a+yktp06An/iDLiHNFKegZp9Ys9II0=;
	b=U5ZR0MygobbIJrX2ijXkF9pW6ed6geMh9Sw/+uQJn2VtQfFfNXCDgYiPXA2OTJJdk5tfSG
	bZPc6AyWc81GaoHA8aWllPyurAQp8Fvuy3+aJeXxwa+TK41leki6C3l9BFUF53RFMfRYKj
	XOV1aVqeOWCK+qkhL7xlzQqBNTtmSmo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-HqB2O3VGOr6aGmBKjqXfBw-1; Wed,
 08 Jan 2025 15:22:07 -0500
X-MC-Unique: HqB2O3VGOr6aGmBKjqXfBw-1
X-Mimecast-MFC-AGG-ID: HqB2O3VGOr6aGmBKjqXfBw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C52C1977699
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 20:22:06 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BA4D11956052;
	Wed,  8 Jan 2025 20:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, 0b7958fa)
Date: Wed, 08 Jan 2025 20:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <55450.125010815220700362@us-mta-435.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7bMV5gIWYEU00Mc86G6HaL3JqYb6c1uHYMZhWvrqtU8_1736367726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.13/dm-fixes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/device-mapper/linux-dm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1616739135

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1616739135-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1616739135-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1616739135-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

