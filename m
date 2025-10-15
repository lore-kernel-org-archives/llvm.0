Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE442E9EDF
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 04:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760502193; cv=none; b=S+H5fLg5Kd8JuTu40k7BRmbUkdZnyZRBWlzlDwfdwNQqnmQ8LdO/ws58zPUVqZX5UtDC8R04MPhJYhzbY8Wxy5BdP7hvCYuya8MGizjY+IecL2xNtYWcQSGlFNAtUDGKXG7B266cBukX9aKkREerrT5Xhb9rEEuwD86jzdwQHi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760502193; c=relaxed/simple;
	bh=OZ0mt5I07aqCmtMoJKACLdccn/un3hIrPc/1DLzA388=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jE5aqW9no602xdwxEnGAar4an85OSnaCooWvgFRVCsv9Sbt+xfYljU++DhvwJ2nQRSRdZ+AfRN+wh0HTEHDTNRVexAJtoAqcjNCuGysfAOmr1gbGpbNtpUZ6HcOLsieXKvUXvQ5BxH2xuC0OGKT2XAsXZX/TGLkOX/r8NIYcNok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G33eXCNo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G33eXCNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760502186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TFbvtB6vOA7pbWNQBeuNMle5JEbn/d067ZyZ0EKtXDo=;
	b=G33eXCNoNZZwVqmSxkhdLBQqwXxEeczEbnqAEouCXZJX0r/W/9qHD6Pkji5Qb+bfYQxc4I
	vy9sm8KqRZzVJevMDpmL9U+U73hYT5LKDF3nmhhL9/Av0byCHQG7r1Sb5AaSWWCL1u720F
	bWKa8AskfYUCAps9Ujtw+YNzBG+nCw4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-368-Tn2lqwI7PIOQoWtpKcnc9g-1; Wed,
 15 Oct 2025 00:23:05 -0400
X-MC-Unique: Tn2lqwI7PIOQoWtpKcnc9g-1
X-Mimecast-MFC-AGG-ID: Tn2lqwI7PIOQoWtpKcnc9g_1760502184
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B2AD1808985
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 04:23:04 +0000 (UTC)
Received: from [172.20.150.82] (unknown [10.30.45.111])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 28B7C1800446;
	Wed, 15 Oct 2025 04:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 4 of 137): Test report for master
 (6.18.0-rc1, upstream-mainline, 9b332cec)
Date: Wed, 15 Oct 2025 04:23:02 -0000
To: haliu@redhat.com, llvm@lists.linux.dev, mmalik@redhat.com,
 omosnace@redhat.com, fmaurer@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <81132.125101500230500300@us-mta-368.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t4vlj8pjtZoIiYrFtBayJAq_IE69A-CXlTcO8GQgjbI_1760502184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'nfsd-6.18-1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2099249630

One or more kernel tests failed:
    Unrecognized or new issues:
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2099249630_x86_64_kernel-debug_selftest_bpf
        selinux-policy: serge-testsuite
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2099249630_x86_64_kernel_kcidb_tool_19767585_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic: kernel BUG at mm/slub.c:634!
                       =E2=9A=A1 ERROR Warn: External Watchdog Expired
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2099249630_s390x_kernel_kcidb_tool_19767579_7
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic: kernel BUG at mm/slub.c:634!
                       =E2=9A=A1 ERROR Warn: External Watchdog Expired

    We also see the following known issues which are not related to your ch=
anges:
        Issue: selinux-policy: serge-testsuite: fatal: unable to access 'ht=
tps://src.fedoraproject.org/tests/selinux.git/': The requested URL returned=
 error: 503
            URL: https://datawarehouse.cki-project.org/kcidb/tests/3565986
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    /distribution/command [s390x, x86_64]
    Reboot test [s390x, x86_64]


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

