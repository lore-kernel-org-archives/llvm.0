Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F2B28691
	for <llvm@lists.linux.dev>; Fri, 27 Dec 2024 12:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735302130; cv=none; b=StiVM0Q45wTGP6QRTe22e2lWO9kAGJG0VmRE3gLTYF3sJJyA4CQnMfnZotwdR8USy7CA1b7sc0ZLPM8leW1iYNnkHDSlrsrE+e59tgG0FoWbvWaoblSeUWkN9ngsg1XdbQSHkCkbQwA0ZhkyA4c74PO2P2de5wsG3OyxHKjLlos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735302130; c=relaxed/simple;
	bh=8SdtX1NqXJfFZJj690cFiV8O0OrfZi1iESF6fcIgHDY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=o/bpLn6O0okGUc7pALtpUEpL7dfw8Eqsl5xO+9le4zYgKbcGChJkiEJiYzCMM1gwgaaA4hWYyZhLdiM8KxM0iGX6RBdvlcq06fVFZVePGV5tMH+vdV5pLezULFn7v3JkWQY1wQRb/IwJk2xbx7wBWSOYrxyed4jBd2uQ4WRnJFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IP/gI192; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IP/gI192"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735302127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q316sXR7QoQXO6vmS6l5QYEu65ol+iJEGUGNSIeDLpY=;
	b=IP/gI192naVJTDEHwlh3vvBHLPZalgm000GeDGglJT6m07uL6ExIJMiULs6KAiCTnsNbI7
	rpue/cz1x4DdDPsfyXrVvGqOViqe8JQvP2QPXAfoCFcgm+IUeSLG2y2j/hLKUW/s2rhh4c
	w2E4/iZV8BQgyuKMNx8+9/ys5TpJKcA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-577-22WRz_2NOt2T80QLyYZX8g-1; Fri,
 27 Dec 2024 07:22:06 -0500
X-MC-Unique: 22WRz_2NOt2T80QLyYZX8g-1
X-Mimecast-MFC-AGG-ID: 22WRz_2NOt2T80QLyYZX8g
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87E6119560BD
	for <llvm@lists.linux.dev>; Fri, 27 Dec 2024 12:22:05 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.32.189])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0005119560AA;
	Fri, 27 Dec 2024 12:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc3,
 upstream-mainline, 59dbb9d8)
Date: Fri, 27 Dec 2024 12:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <76197.124122707220600388@us-mta-577.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JJpuCe6KHqhJxdRZLpAkIOAA2UKac4ylBzbaMU6rxfM_1735302125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'xsa465+xsa466-6.13-tag' of git://git.kernel.=
org/pub/scm/linux/kernel/git/xen/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1592841475

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1592841475-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1592841475-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1592841475-x86_64-kernel
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

