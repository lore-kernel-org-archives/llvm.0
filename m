Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAC35258
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361070; cv=none; b=ppwog35aNLlOc5zEvuqscXh8nbfq3b4644+6oXZGt7qOvh66G7EIY/ED/mTYkm+OHSaoMjP1q6PfFaq1K+iiH6lbRMZQb+5jl2mUhwWOcAAL2KaSmeauM7FXL7CZwYDilGKgqkYNlkVVMRoxUdHFLNoMeuzogaQq5uWYnqokV6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361070; c=relaxed/simple;
	bh=3pM7uCwtIHvMBHc1x8f85IE9aA/kLQzlzI+1b2N/B5Q=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tY7+jF9zodqPV6K6k38+4vLEztj++4ICPM5edOSANhm//kIRCJb3lQ4LRIoQeepK/pYjetHpDZ8XRtaefOmYnavwlvJsiKgLWU9twk6ji2kwS2IXwpIfAoaTSS84c7cnViqdc/M5dNPhD8s//H0nDJaGao015gke/NOZ2IzpUGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2GnY9pf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2GnY9pf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727361068;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=J3C5uGCBrgkaVYshV0DWyIoLQFXNSFgx9z34B+LbQnc=;
	b=H2GnY9pf4R3VAhCJsAX1RSmY3Ru56eY4bwQKVI9xr4V3WZ6+t99lwzcw+v3c9bFb5KHCKz
	AortRymDj2kT/7b+DYKQlJxNNjtI+geuhbQA0ckRUYs+VMRZxUhDmCT1KzQu/8wzwToFFX
	KxTEOsbks22PoL2hE/7NGOUFzaBRWIs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-292-2NX84pPUN9ySMUfw0NjYMA-1; Thu,
 26 Sep 2024 10:31:06 -0400
X-MC-Unique: 2NX84pPUN9ySMUfw0NjYMA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 196F61936CF0
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:06 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BEB613003DF2;
	Thu, 26 Sep 2024 14:31:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc6,
 mainline.kernel.org-clang, 67784a74)
Date: Thu, 26 Sep 2024 14:31:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <40159.124092610310601643@us-mta-292.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'ata-6.11-rc7' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/libata/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1435763668

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1435763668-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1435763668-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1435763668-x86_64-kernel-debug


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

