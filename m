Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E34A199FA4
	for <llvm@lists.linux.dev>; Sun,  6 Apr 2025 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743963730; cv=none; b=EgNgyTbABriM0AEKQxtvoxw6ntTYv7SMSEPfSIVOwscIxzxsxqXCJn+MJHrvNt/N3mqDxijYwnm4KgNnKPYVwOymBD/VEi9ra45C40daDN3M+MPANr5POCzxGBEQqkk6i7MRS9uKfRqEV9/iwWMOkJEc1FRbeLYb6/bzb+lMML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743963730; c=relaxed/simple;
	bh=Wcj0vKs+HJu4Ul6JJsuSx/rp5jT1QoTG+LKdRv1esPQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ZOA9PtBPd759Y52r6+2o6hnrPpAjpyjfeVxHuRee7cO/clBajEYp+7PxOS/0SOQs+WcZHBc9z1/qFPgQ+0xRBsoCU+ohKfg2KYEDHiPsSVwoI/uYT0uhIMifnPwgW0KoCVojgE8RNpS31IF+ENeIawCcfwH+nFdp4o2YRZTY9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QBeb/kqW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QBeb/kqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743963727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dj19jb2KId2an1AwU/F92QEMao1DJPZt4o/Zx36atzo=;
	b=QBeb/kqWQiibiqAscdrK1r8FhOEawOoipcDYjyl33pK+s6rvgn4AXJ8xLPSOHWD37kMfa2
	9NEYGVv7OySWWMORSgYOcNU7BbhpGW2G509rlYbeQTWYZ5MWjyfFoNPPMiHmfOdiw2nQhI
	nKFv1WSsbtJTAyYorTXMn/0fNPHWspA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-569-A4Orla1JOgGyfHxuxwDwpg-1; Sun,
 06 Apr 2025 14:22:06 -0400
X-MC-Unique: A4Orla1JOgGyfHxuxwDwpg-1
X-Mimecast-MFC-AGG-ID: A4Orla1JOgGyfHxuxwDwpg_1743963725
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37B371800257
	for <llvm@lists.linux.dev>; Sun,  6 Apr 2025 18:22:05 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2CFA180B488;
	Sun,  6 Apr 2025 18:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 16cd1c26)
Date: Sun, 06 Apr 2025 18:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <31422.125040614220600447@us-mta-569.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Adiha_vWs3uXfM1SpAB2BUQ7WKafqEEw0yhOT_mtFk_1743963725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'timers-cleanups-2025-04-06' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1754603968

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1754603968-aarch64-kernel
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1754603968-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1754603968-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1754603968-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1754603968-x86_64-kernel-debug


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

