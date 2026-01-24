Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98893164B8
	for <llvm@lists.linux.dev>; Sat, 24 Jan 2026 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769258541; cv=none; b=iyZZGF6zvgqdTm8q3Nku2Gf2OepQfO5L2zg/nGc4gaksrVB6Zk3JAmYqK3wFHHEfrAali9zmXtULpXS281KvnixiwhiikRW069jGtlAFYPDcX3Sqji1WQ3RO1NZRFux/OHHlp7/9r0CynBPWPsnMOz1mFaqIyIZNhwhrQKtvTK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769258541; c=relaxed/simple;
	bh=OS+bB6nqKfyIyzs5Gbaj5ij1c9PF/pLvq0QVg9RqwEQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kyVMAtFk84BQYI3DY5bZ4wWU5J5GNw+hOeiKwydETkXiekdPy/wJ7WaiYy7296pHCiCpQMVeuV/4aja6ScScxqFEsxwzxpc5DL+ePRx2IV4xSTwyEuCr/XTEc8KSzg6Fz95QWpOz90Y+4nZCfVOadTZLUa/3hk5g4qRF2++tbRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gYbmE4mQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gYbmE4mQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769258538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1GdTHFEMXXiiGz2UMIppYqrPpMlJMdAaMir/HGQ1ZjM=;
	b=gYbmE4mQ6UQtelfP4eY1HDVhUKMs5m626LBgI8dK9T1xjyPIuXnYKYRplZiaMTaoUtjQ3+
	KJUoaM9bn4YB7LJ7ifblN38S6wI+h9UGEe0jHCJ5Nhi0DE0DfTgmApluoJdyGNqGab1fkf
	nxuNPYDAnQQp0ZDTUkuySDlzs9h4DVU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-yg7ou3A-PAiKiHY1IciMUg-1; Sat,
 24 Jan 2026 07:42:17 -0500
X-MC-Unique: yg7ou3A-PAiKiHY1IciMUg-1
X-Mimecast-MFC-AGG-ID: yg7ou3A-PAiKiHY1IciMUg_1769258536
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4A671944EB7
	for <llvm@lists.linux.dev>; Sat, 24 Jan 2026 12:42:16 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E991F18001D5;
	Sat, 24 Jan 2026 12:42:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.19.0-rc6,
 upstream-mainline, 62085877)
Date: Sat, 24 Jan 2026 12:42:15 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <55523.126012407421700139@us-mta-271.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7vA2ebSL0Pucyo2-Xrfqm-OofQvvIPg4UkKq2_hq-ko_1769258536
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'kbuild-fixes-6.19-2' of git://git.kernel.org=
/pub/scm/linux/kernel/git/kbuild/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2283445629

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - ext4
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2283445629_aarch64_kernel_kcidb_tool_20514549_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2283445629_x86_64_kernel_kcidb_tool_20514544_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2283445629_x86_64_kernel-debug_kcidb_tool_20516075_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: [cki] [tests] unblocking setup-task failures (SELinux Custom=
 Module Setup|CKI/restraint|machineinfo|setup-nfsdump)
            URL: https://gitlab.com/cki-project/infrastructure/-/issues/777
            Affected tests:
                /test/misc/machineinfo [aarch64]
        Issue: [rawhide] [aarch64] avc:  denied  { open } for  pid=3D14791 =
comm=3D"systemd-user-ru" path=3D"/sys/kernel/mm/transparent_hugepage/enable=
d" dev=3D"sysfs" ino=3D1784 scontext=3Dsystem_u:system_r:systemd_user_runti=
medir_t:s0 tcontext=3Dsystem_u:object_r:sysfs_t:s0 tclass=3Dfile permissive=
=3D1
            URL: https://redhat-internal.slack.com/archives/C04EX425HP1/p17=
65900650445969
            Affected tests:
                /test/misc/machineinfo [aarch64]
                Boot test [aarch64]
                Reboot test [aarch64]
                Storage - blktests - ublk [aarch64]
                stress: stress-ng - cpu-cache [aarch64]
                xfstests - btrfs [aarch64]
                xfstests - xfs [aarch64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]



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

