Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 524B21F92E
	for <llvm@lists.linux.dev>; Thu, 19 Mar 2026 05:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773896591; cv=none; b=VgUNGdxB4gxBm07cNma1uUzrbUifLm4V50iyZtlO/X1JrIwj6HURarZTckVsA1TMK7+b6hkTUwRjeC7o8T7S6leqNJkBLeWYtJjq54DITpaZHSuMta4znxvQZa7yplYKTd5tEz/k3hiCsAKZwDyW2jM017rdqTYQVwYB84ek+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773896591; c=relaxed/simple;
	bh=PJZ59D79kTDeQ4mHhc+fLWpDR7mylanwnphq48/AXSU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CW494kX6OOlkHxRnncyvU0Dfj0vUUYO/PsY++WVYBqLDs2sXkUwyOM1qKmkb4JC30njLHdoWfq1im++NTqYPNQFVJA0MuxJxm8sHdArVZniNwq9uvWNRQqMWnp4/94QyPhjIpkSJIE7vi+CFb//yWvDEHCXEIhGMnZAq3UUZ05o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YPL4zwNX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YPL4zwNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773896589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AVaKxtwIn6Wu2rFti6gqk2yew5yW2xmCWNzXju0cEss=;
	b=YPL4zwNXVfdmwutDzqZ+E46lrRv2vqoYqfMqRotK/7E+4+RVqPmbyMAdUxFeCemk1e8VYp
	j4FKUEGzacvCpIS7xfdQ+TKgJ2EZwHpMYa7UDPnzcgBmr9fAV2SapOCRxyA7+OON/zJnJt
	A+TSJo/qk08DCVQ9VE2Sb9Vc93gqMS4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-2WZOPPQPMpKCNb61NpRsQQ-1; Thu,
 19 Mar 2026 01:03:06 -0400
X-MC-Unique: 2WZOPPQPMpKCNb61NpRsQQ-1
X-Mimecast-MFC-AGG-ID: 2WZOPPQPMpKCNb61NpRsQQ_1773896585
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA3AB1800365
	for <llvm@lists.linux.dev>; Thu, 19 Mar 2026 05:03:04 +0000 (UTC)
Received: from [172.20.92.244] (unknown [10.30.44.31])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9CAA61955F2E;
	Thu, 19 Mar 2026 05:03:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc4,
 upstream-mainline, 04a9f176)
Date: Thu, 19 Mar 2026 05:03:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <13060.126031901030600250@us-mta-650.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: brVOfZWpFb_g0PnuT23NpeYthMB3MD7FXvShL1ijP7Q_1773896585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'soc-fixes-7.0' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2393900489

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2393900489_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] WARNING: drivers/gpu/drm/drm_atomic_helper.c:1920=
 at drm_atomic_helper_wait_for_vblanks.part.0+0x228/0x240, CPU#1: kworker/1=
:1/54 - RIP: 0010:drm_atomic_helper_wait_for_vblanks
            URL: https://lore.kernel.org/dri-devel/69381d6c.050a0220.4004e.=
0017.GAE@google.com/
            Affected tests:
                Boot test [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

