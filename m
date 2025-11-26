Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5B9275114
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764135737; cv=none; b=cAZNFINIQCCU+rM7LUna4flGZVM4eH97TxxHAzWUUKZcT6zsXV3exLUHwyi5qDIZw6SWgGmJeHkUj3Bjug22wZ3ci4n/mjF3BCH2qOQ4OhOwsyL9rxBlb8LaIIvtFqPcRv6UgHQXr46Q8kB7nrx3J4aYJ+q+MoGVyicXyDrSrdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764135737; c=relaxed/simple;
	bh=eb/bvIu6avztDFMnMWiQoigfcv0pOCMmj02G1YK7fI8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=pM5J9ianepMkW+mfZWt36gcLS1YPg/x4bBQX5uCGHmszNB7DVUYt6hNTHpAHSXTZuBkyFxn7VoDig3ImWHFU6+PPjhVdtJhoLpykgaPQV5SvdDNX0UK+qYYvhtR29UBdnbY1Ze/RcwOYVHvBW52bqDSVSqeuQz2yRYiBSZVBe4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eOPy6usK; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eOPy6usK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764135733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iTf28j0gNUzu0EFENl0vjyWOpxr9Gb+S2U8n3TyRRAU=;
	b=eOPy6usKLvvsfB0P2GnPW5A/Alzk93mZc0zaADjCV/pM3AW9FxqOlFejW7incwQFtULkBM
	TNXKrUWjaGlmsOnpA0s5jF1y10dtU+4WwudunmlkgdbyBsSc1rbrcR3GNuoooLZENxW6Vk
	3Dxr6P7iDYLIY7xXWUsYOT+YK8qtT/c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-8-jl0z6uc4NbGBYQtMyaR1lA-1; Wed,
 26 Nov 2025 00:42:10 -0500
X-MC-Unique: jl0z6uc4NbGBYQtMyaR1lA-1
X-Mimecast-MFC-AGG-ID: jl0z6uc4NbGBYQtMyaR1lA_1764135727
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04C69180047F
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 05:42:07 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 80AAA19560A2;
	Wed, 26 Nov 2025 05:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 12 of 110): Test report for master
 (6.18.0-rc7, upstream-mainline, 30f09200)
Date: Wed, 26 Nov 2025 05:42:06 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <66978.125112600421000136@us-mta-8.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OmKdR50DtghKRFs0pZJCyVVzRFUi3axN5G49KAxKz18_1764135727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'arm64-fixes' of git://git.kernel.org/pub/scm=
/linux/kernel/git/arm64/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2179073679

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2179073679_x86_64_kernel-debug

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179073679_aarch64_kernel_kcidb_tool_20090729_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179073679_x86_64_kernel_kcidb_tool_20090733_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179073679_x86_64_kernel_kcidb_tool_20090733_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL cifs:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - ext4
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179073679_aarch64_kernel_kcidb_tool_20090729_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179073679_x86_64_kernel_kcidb_tool_20090733_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179073679_x86_64_kernel_kcidb_tool_20090733_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL nfs4:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - xfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179073679_aarch64_kernel_kcidb_tool_20090729_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL xfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2179073679_x86_64_kernel_kcidb_tool_20090733_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL xfs:install_xfstests
                       =E2=9D=8C FAIL exit_code

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [RHEL10.0] blktests throtl failed
            URL: https://issues.redhat.com/browse/RHEL-66783
            Affected tests:
                Storage - blktests - throtl [s390x]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    Storage - blktests - throtl [x86_64]
    Storage - blktests - ublk [x86_64]
    stress: stress-ng - cpu-cache [x86_64]
    stress: stress-ng - memory [x86_64]


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

