Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5885332D0DB
	for <llvm@lists.linux.dev>; Thu, 16 Oct 2025 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760631793; cv=none; b=LVsPrkDvWC+zLzTVsoIsnUslNNifEF3hxFJeAzrLZcaXQPc3TsMBE+RgR1f5YTB3iuxwt5C2sPsdM0kR5qpfNGh8DjZkZFXIXFk/DaQ+XqlFUE54+5nZC1yPG7tZe5STFgDrXssVb1IfDzdzfrshAMP+MW6CS/pc3zgDBB+MKSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760631793; c=relaxed/simple;
	bh=/wzugdFt5W9WxdDHeLYkKqwXp2K/ydAKC9TOtyK3JY4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=M32Wmk1d9l/YvAiMf4zWQI1wdAfJwwlaBJLHkbqS+LlBk1ztAbHpET5W8BcQ8sydZ22r7EQkNB03UwChpEkVGWfWVqx8xTOz2F3g4/v8ghujE4Xv4A8RDJ7Ulnqfs/dfDd8cp3SDtHrG22EPKtzI9qbncnNnn3ARm5/9zZSIvdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OywuOSF4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OywuOSF4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=og8T5Koz6EMOOkAEwY10d3iuQUiqFbwERB6ph4C1OZM=;
	b=OywuOSF4TfEbnDSFB/CyG+Rp/HWvJXOCkt8gDp7Bika9t3gayiFJ8YiXmH/vqeFcWfk4Wg
	XudC6w3ChRUNrcLGW12+NxltYUqQOgPoyN12DKJf5/pJiKhs0LR1w2AFAtnG7glRJosMWe
	84pVFd1xOnBYj7/VjU1sm9rtiCNwWW4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-oS_Gjz0GNgCFz5xZ_Gtnjg-1; Thu,
 16 Oct 2025 12:23:07 -0400
X-MC-Unique: oS_Gjz0GNgCFz5xZ_Gtnjg-1
X-Mimecast-MFC-AGG-ID: oS_Gjz0GNgCFz5xZ_Gtnjg_1760631786
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B757180035D
	for <llvm@lists.linux.dev>; Thu, 16 Oct 2025 16:23:06 +0000 (UTC)
Received: from [172.20.84.201] (unknown [10.30.45.119])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D0321800452;
	Thu, 16 Oct 2025 16:23:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 42 of 137): Test report for master
 (6.18.0-rc1, upstream-mainline, 1f4a222b)
Date: Thu, 16 Oct 2025 16:23:05 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, yoyang@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <32665.125101612230702344@us-mta-654.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WtPINXWArE-BtRJKSGpAhORu9SVUsqjcHjHXxPAdvAo_1760631786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Remove long-stale ext3 defconfig option

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2101484878

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2101484878_s390x_kernel_kcidb_tool_19777182_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2101484878_aarch64_kernel_kcidb_tool_19778101_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/414

    We also see the following known issues which are not related to your ch=
anges:
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Reboot test [s390x]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - net [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [s390x, x86_64]
    /distribution/command [s390x, x86_64]
    /test/misc/machineinfo [s390x, x86_64]
    Boot test [s390x, x86_64]
    CKI/restraint [s390x, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [s390x, x86_64]
    SELinux Custom Module Setup [s390x, x86_64]
    selinux-policy: serge-testsuite [s390x]
    Storage - blktests - throtl [x86_64]
    Storage - blktests - ublk [x86_64]
    stress: stress-ng - cpu-cache [x86_64]
    stress: stress-ng - memory [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

