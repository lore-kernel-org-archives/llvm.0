Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6FD13C80F
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723848731; cv=none; b=qBEDz0wh/nvLSXqDY1G+NsxBn9TEExzBx7NJ/raGEOifSGMVnq4tprv76/3p/6ACTR8lXm6FzhwqpahD6Zv+42z8niyEQpn8IKFN2p6O/iy6U+gpTi0p6BCFV9dyYwAfZXX9vbxBlme8OMjTuZy68LiTFDc5/Wn2Gt6eAMjko0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723848731; c=relaxed/simple;
	bh=Ee+SNLDnDQ9+Z6IAm4+d8rL4sxTbntKeWj8nwDB2Fb8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tguuxrEhBBaBaBCS0hEiPCUtGJOKxSAmJOqh91elzIqX49HziM+bOk4EYAie3EzZ3i6+hzi4ZNEKd/b1EXbySorZiBBXxuaWXvAiZ4PVVWd4T5hVq3iQJFpOyH6yl1pUm8R3G/P64ERwJDbxaARoREDyBoZjlQZZ71VRaLh53U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dS7lIv4V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dS7lIv4V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723848728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ernk6bPKZGb9tGmlhMP09ZL3/wsIcJLsGnaCW3YlnOE=;
	b=dS7lIv4VDYl5xT0k1JkzFp7GDq/H/3fgN6BqyXa5NEyHtI0y1pxX4qjlB6/bzzrZ+cEkhd
	5FHi11SdJQwDr/C9uFY0/3CrX+DSOxBayMx4ivsXM1gH35pVtAcj9NjodN86efb//RVGAd
	gUkDknJtKXeUYCO2bKuDNQIT0dPlG2o=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-266-BV9SWur8O-eKdgBEyIHqag-1; Fri,
 16 Aug 2024 18:52:06 -0400
X-MC-Unique: BV9SWur8O-eKdgBEyIHqag-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0CF671955F3D
	for <llvm@lists.linux.dev>; Fri, 16 Aug 2024 22:52:06 +0000 (UTC)
Received: from [172.64.15.52] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 70C7C3001FD6;
	Fri, 16 Aug 2024 22:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc3,
 mainline.kernel.org-clang, 85652baa)
Date: Fri, 16 Aug 2024 22:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <35370.124081618520700193@us-mta-266.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.11-20240824' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1416510727

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1416510727-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1416510727-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1416510727-x86_64-kernel-debug


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

