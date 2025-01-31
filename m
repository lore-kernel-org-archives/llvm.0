Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC51D139E
	for <llvm@lists.linux.dev>; Fri, 31 Jan 2025 03:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738294931; cv=none; b=Reu/D6dB1dkHZEha02bOnyDYSvlpt+S3t/FrYWkZ/KSgfG6HJDluX+dyccwgFTpIl8mZBzb+hUjoYa9DYZlYYzBqfr4HaWvPuFCgPus0ShrHkkUxs/xDff5HAqzWbfgQX7mD6nP0NeIi2IPTrypMiyctG1+LJn/KVg4BM3F9B0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738294931; c=relaxed/simple;
	bh=o7yr1itDOnFkrFNhS7f5UnliKpMPyoEtT8KRzmpr0eM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PVbEuVC8iPvOlD9Z/JaQ2Rl5reQCQi8gCsWAP6uszRw+sfLlotDSaJkhkuKeiPUxCoEXQdrJBPDE1xKi8P5gci+n++082qX+uTtEEj7wm3hRMlj/iaFbE83wAbE7W40C1R+Ddj38oCnA78NNCKQyueSOGq8QnW/CF7mdW6fEHWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YmRYho/I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YmRYho/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738294928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N0UvNnDb2470GYRSAuktre3PAZFfwn7ncCM/m4xaUQ8=;
	b=YmRYho/IaBLC9S6jb8ZckxeP166IVfEnM5Vasu5JwpNtUNxd76zAC0W8k5q8Otkl8xpP0Q
	o2dw/Uk5HFhEpAVix3mM6Jq9MQqKZ2PPATV1bsus8BWmXYPAOA1BkPrg2/J8vdQd2JeoLb
	5ydHThT6DWOwYTy1CULbDZUZakioZRI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-pwIBNGp2Oo2aaBIEwtNdMQ-1; Thu,
 30 Jan 2025 22:42:06 -0500
X-MC-Unique: pwIBNGp2Oo2aaBIEwtNdMQ-1
X-Mimecast-MFC-AGG-ID: pwIBNGp2Oo2aaBIEwtNdMQ
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 14DDE1800361
	for <llvm@lists.linux.dev>; Fri, 31 Jan 2025 03:42:06 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6C0D81800980;
	Fri, 31 Jan 2025 03:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 69e858e0)
Date: Fri, 31 Jan 2025 03:42:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <22691.125013022420700178@us-mta-387.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vbGRwp4v0aykDaGJ3ywiuq3L6v5aHzFpTOwKxqmd95A_1738294926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'uml-for-linus-6.14-rc1' of git://git.kernel.=
org/pub/scm/linux/kernel/git/uml/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1649514362

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1649514362-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1649514362-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1649514362-x86_64-kernel
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

