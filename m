Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C398405C57
	for <llvm@lists.linux.dev>; Sat, 16 May 2026 13:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778936594; cv=none; b=L17DNbtmlr/x62MrCqvyDlClJxp3dE0f+c1ducI7K13qslpswqKF3nHk/QEuqWZmAP6knuY1j/no/owbeo1SHlNLgKL9/dmG6dhCIZnDzTbM2uwTpoYwxPcgWEXYnUNB34WlXaqzEyLLIvXrGq2yyFDnwNtv+V/ssI/dByrBNgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778936594; c=relaxed/simple;
	bh=rFr1YZG0Zf/pzBxZ7a7xVCrA/j5H2HlgEYxLv5Xgjws=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ZKaRuZMD/LTgR6OsGmOrR+6r4nIzerZJc1jULzOiR8wf+xpMjs1TI+Gf+ytK8bs8Ur36dh42bqilwzgZivhhYvTFUUtew+7GnbF+sPWrlwgbQO7A05l3YPhrgVntYpmC7xQKtHWmzZSjV/MRHQQ3qSRCvYvD1v6cjAKD2jBHLQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XMIKmUDO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XMIKmUDO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778936591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LFHF4Rcr3PmF0n87iOKEK/aF1k4evaPYHer47VXnWJY=;
	b=XMIKmUDOku7Egn2WiGGf/BcfJ1ZKB+qQMhP5E3u/7Am2o+d0iyayW0Ae+Y884iwaem8jPx
	N3XVjO/2oXvL7SE5J8DoL7eHPuWkxwBMOwpz9Mwr+wsAwj+RzYYf3OIjEdaql3sxo2GYLw
	bU6zslf1a8dYY3BHcbkZdWJ3a3beXy8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-253-bok3Xfa2NIyqEay3GruuzQ-1; Sat,
 16 May 2026 09:03:10 -0400
X-MC-Unique: bok3Xfa2NIyqEay3GruuzQ-1
X-Mimecast-MFC-AGG-ID: bok3Xfa2NIyqEay3GruuzQ_1778936589
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1EFFA1956052
	for <llvm@lists.linux.dev>; Sat, 16 May 2026 13:03:09 +0000 (UTC)
Received: from [172.20.187.136] (unknown [10.30.45.25])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A485E180058A;
	Sat, 16 May 2026 13:03:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc3,
 upstream-mainline, 6916d570)
Date: Sat, 16 May 2026 13:03:08 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <51131.126051609031000645@us-mta-253.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: udJaE8oNcITuL-fN7ZwEtMXaaUcmH87X1s6FdCtVKkg_1778936589
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'drm-fixes-2026-05-16' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2529409396

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2529409396_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2529409396_aarch64_kernel_kcidb_tool_21296375_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

