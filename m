Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862D92F2A
	for <llvm@lists.linux.dev>; Wed, 20 Nov 2024 22:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732141388; cv=none; b=AaS0bJ/zbNSH4zuSFWtMsqA+RO6we212BTKzSgcWeghhwIpBFInqIZsLpYLDXIN8TNCpjB3/jlBj+Iz3tK8YIaejTZKag30fAPAhBCONIBOgHn24RDVQl1xlVM3sga/1I8BfSf+fo6FETMzu4MAqgB9YJ7Vy7NoYgRKj/rA8Scw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732141388; c=relaxed/simple;
	bh=0PaSsmcVmefXE0xrHLI1qQZWFuapnlXY/F+YT/ME9u4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=a53TTKhM9yetp8E0uj9LKxIThhBxZJ0x3dq7CJLn4nm0CEsJoofsLJ87A3NMmum28Gtzk6nmtl8lS0sNZ0JIPS3xhUxYVU5PMBRJ31OWuHhH7OCLPQiDMTHd9l9Z8KeSCw0KvIy1L2P9C7zIN6HiyuTDlN/nCJChL7VwGM8P+2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=McP/TBc3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="McP/TBc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732141385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=58l5zwllmXDH33kyEAEm6fM9qUiYvi2EzODXNxdYC/8=;
	b=McP/TBc3MOPV7gGz6UkuuQn1/BUfrh8fQZW0fh5u2UnkIR0R/5bWG7TCt4FmnJetc2qB/o
	bsJiZmOGuh+nVFLBSZ0341PY/jv4LQ7LD530MWoEflFZISeLJWDyz5EDx8oS9I8G2dMGbH
	LbbA+54C7lX/3fApsgep77bpAsbF2Nk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-151-cpG9_GMdMEmdzfj_-P1-Qw-1; Wed,
 20 Nov 2024 17:23:04 -0500
X-MC-Unique: cpG9_GMdMEmdzfj_-P1-Qw-1
X-Mimecast-MFC-AGG-ID: cpG9_GMdMEmdzfj_-P1-Qw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A7001955BC9
	for <llvm@lists.linux.dev>; Wed, 20 Nov 2024 22:23:03 +0000 (UTC)
Received: from [172.64.9.62] (unknown [10.30.33.134])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9F8DD30001A0;
	Wed, 20 Nov 2024 22:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0,
 upstream-mainline, f2ef3972)
Date: Wed, 20 Nov 2024 22:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <70293.124112017230400289@us-mta-151.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z7sES8_CIXjlmH4884CLay24VfdvoGgV3GVSeqJ-qj4_1732141383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'spi-v6.13' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1553374162

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1553374162-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1553374162-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1553374162-x86_64-kernel-debug


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

