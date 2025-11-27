Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEF813B284
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 15:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764258192; cv=none; b=EHYj15aGDnTrSjTAxrul3iTI35ud1h2G6qZqhR9hWsAClVyyp+r27LHkDwNNp3QZN5b1DY6Xd6frV/LX5hes1cJNLxgiVkTBAHnm6+Y2gVoLw7TuYAhFCzMO7LzTGU8361IXxELcjZPzbk/ebVtOtbbQa4jq8Jk3LoiNMyR3sN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764258192; c=relaxed/simple;
	bh=XzwwVIOSxF6QmyVnjNnu0+Z3ToWgRFS6bX+EksdbrIc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KxoqD3/InNp/C0d+aZEbeM0Vssf6tjoCItdm7U05JsK33Dhwg7Yg6r1G3sDkSLz7UApeRJDJaiT5gl8/gZalfKfhShEl49NzcGLuUOPz55G6Xlxn5vAh9yIE6/y6nFEd+c7ptOOhJPvEZ9goUBzfVMTRnMuiZARxtjkW56myNwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CYciFEOR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CYciFEOR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764258188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wYu5P+AoimK6AF491bEFEPdcvHtAOKt+v4AC/HQypQU=;
	b=CYciFEOR8EhwsP7+hibmkMqJ1Fc/ICKsv0tMGPyppkDR2XiyT+Wot7T1b1NqtSybY6x4E4
	//Yg1B0ysVsTm2rZY1Ztq6GE3exthAjS/X6IO7FLgD0QzokiflZX8wM/lLV9W1WrW3sOC9
	1Tq8nnE70t6g8FJ8f8g1hCUOPYDIrPQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-o44PDo8XPCiBVLz1iM0XZA-1; Thu,
 27 Nov 2025 10:43:06 -0500
X-MC-Unique: o44PDo8XPCiBVLz1iM0XZA-1
X-Mimecast-MFC-AGG-ID: o44PDo8XPCiBVLz1iM0XZA_1764258186
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0824319560B0
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 15:43:06 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B30319560B0;
	Thu, 27 Nov 2025 15:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 21 of 137): Test report for master
 (6.18.0-rc7, upstream-mainline, 765e56e4)
Date: Thu, 27 Nov 2025 15:43:05 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <26870.125112710430700105@us-mta-626.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bTXi5bgKyhZ257KfNKAuj7mDG2iHGvu-x4VOMsiObQ0_1764258186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'v6.18rc7-SMB-client-fix' of git://git.samba.=
org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2182213180

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel_kcidb_tool_20104303_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel-debug_kcidb_tool_20104308_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_aarch64_kernel_kcidb_tool_20104299_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL btrfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel_kcidb_tool_20104303_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL cifs:install_xfstests
                       =E2=9D=8C FAIL exit_code
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel-debug_kcidb_tool_20104308_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL cifs:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - ext4
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel_kcidb_tool_20104303_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel-debug_kcidb_tool_20104308_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_aarch64_kernel_kcidb_tool_20104299_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL ext4:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel_kcidb_tool_20104303_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL nfs4:install_xfstests
                       =E2=9D=8C FAIL exit_code
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel-debug_kcidb_tool_20104308_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL nfs4:install_xfstests
                       =E2=9D=8C FAIL exit_code
        xfstests - xfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel_kcidb_tool_20104303_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL xfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_x86_64_kernel-debug_kcidb_tool_20104308_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL xfs:install_xfstests
                       =E2=9D=8C FAIL exit_code
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2182213180_aarch64_kernel_kcidb_tool_20104299_8
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
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
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

