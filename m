Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D97A2DAFD2
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050382; cv=none; b=hFZ0vdMLZtGz95MufzDawW9uz6WRA0i88m0jvYTDpMYJRV/IR3wzk3zgOgTI6j1+DykAIitH6ZLqfYiw9Hl4rzZGFUmFGLaBd0jrIuahHwiYXvpuIePBVr3WwcKod1sFgJghwMQEhljsgpAE9++mUaGm1ZeFuDpvuHIx+HdW30E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050382; c=relaxed/simple;
	bh=kLZ9lc5nwm+RG6hiG/8F/NNgfs8m9TX8/26PAW4vdxQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=C54MeJcnC5EqCwXMKTeFDQWpRb+3HWR9Zf/ulZ6dm7hsxFo3qyCf2S+E8j4VdAjXTz9i8j+xibRXF/6V0BicZe0lcz4NOdWTTqG1/9xmxKtAS8BiuYOcBkFsoQPMDSpBiMaxHoDeMF/Jr23oOeBUbwT+VX5bFlVookyUjzCD3kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AG+5rgaa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AG+5rgaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eNXjRuUvgKzC6y6Y32PWjtIDvbjoPPdoYVIa1VeIIWE=;
	b=AG+5rgaapibIndUNArV3MnBXMuotgllC8u2kBmisNdLOtiV56yHvGHXNS9NE4TI4aOM3El
	EI3qB4BjF5zlALTX1gaGDYsNlkIwkaGL8kBDM9QMDd0fen3H2MF3mqVmZ3ej/UVMUjDRod
	B0Ie0YaKx43baRxyrFOSV/kxp5HLnv4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-218-vvbJSGj_PDOHNmEGdlNkEg-1; Tue,
 16 Sep 2025 15:19:34 -0400
X-MC-Unique: vvbJSGj_PDOHNmEGdlNkEg-1
X-Mimecast-MFC-AGG-ID: vvbJSGj_PDOHNmEGdlNkEg_1758050373
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B00D18002C0
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:19:33 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BF4441800447;
	Tue, 16 Sep 2025 19:19:32 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.16.0-0,
 upstream-mainline, eacf91b0)
Date: Tue, 16 Sep 2025 19:19:32 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <56970.125091615193400207@us-mta-218.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tF42XDU_73cAKwjjfMGdWDQj0Fry6sIlPAJbjwQQx8E_1758050373
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'fbdev-for-6.17-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/deller/linux-fbdev

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1962685362

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962685362_x86_64_kernel_kcidb_tool_19276251_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1962685362_x86_64_kernel-debug_kcidb_tool_19276216_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]



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

