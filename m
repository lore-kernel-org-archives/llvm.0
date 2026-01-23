Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB263EBF3B
	for <llvm@lists.linux.dev>; Fri, 23 Jan 2026 23:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769211803; cv=none; b=egFNBXLqrfpy6f+FVpkD94Xvm5FKFENOtjoIg3k4b6I1VDUMq+BNKswtjCQBK3T+YLJiFRlI4amg2ROukcAn9mcqm1NP5FyaO5eVFQ7p0c01D5ZiyxaxfwB4XQPKNUf8xbhQMKs/qxKTPIMuldMXFCpj6UbO5GKr6p8zOg1UtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769211803; c=relaxed/simple;
	bh=tLQ+oQzNTlM/ZF+tFPqeTzLmw5JlzYbZdQfZ1Y5FOro=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HU5jMbMfjQJS3jWSxQEp1VAvlaqOzkO3cXRcwwpzGNOXri9pY5MUPTnjfzsK3j/DSeynxSa7ssmeaaxuyLWgYJOeH9z92T7RI/F2KVm2NN+QhvAxVM12kr3qCjF1Yx443tenDCkrfMsvOzIeQGS1jD1yCAMKtanQ6IFL3Kvyxmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y3KeGmqQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y3KeGmqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769211801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0dkXuBOu88aB9ZfNSgNpjHatBMVkx+fmE4FE2ok9q8Q=;
	b=Y3KeGmqQ7H9cBDi9kwAzk/LPWk3l7uM4EXxjA9vUXPgKIR3wi2wRGrLgjCyHzPsTsxHo0O
	FDxa0uccdLLTEe9OIEoNGCc6KQVuhxI6uOMvYO4qJYbo11Df4Mtb6et0AoaUld8SuWU+SU
	QXS7ncIU5lwSCR/TM/f/t48bfPh8qq4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-fPBBQZ5KNXqcrCA5jEB2QA-1; Fri,
 23 Jan 2026 18:43:19 -0500
X-MC-Unique: fPBBQZ5KNXqcrCA5jEB2QA-1
X-Mimecast-MFC-AGG-ID: fPBBQZ5KNXqcrCA5jEB2QA_1769211799
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF0EC19560AA
	for <llvm@lists.linux.dev>; Fri, 23 Jan 2026 23:43:18 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82AB31800665;
	Fri, 23 Jan 2026 23:43:18 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.19.0-rc6,
 upstream-mainline, c072629f)
Date: Fri, 23 Jan 2026 23:43:18 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <96018.126012318431900309@us-mta-195.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DVx0INFAzB-Dh7U3UHhADHHEH4wwBNVeXyTMxI-_5vU_1769211799
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'v6.19-p4' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/herbert/crypto-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2280809649

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2280809649_x86_64_kernel_kcidb_tool_20506773_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2280809649_x86_64_kernel-debug_kcidb_tool_20506881_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309

    We also see the following known issues which are not related to your ch=
anges:
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
                xfstests - ext4 [aarch64]
                xfstests - xfs [aarch64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
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

