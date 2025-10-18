Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2FB126BF7
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 20:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760818338; cv=none; b=LwF8reF3NZVoz7tZmI6gYibvLjS4Lsy9PwFKn7UzGCgfabFvV7B8Gyx7Pcoj1JZWChc1Rql37pxNy333ZVIXFrLSuaAcji4oZmWIOIJwS4OqACxmmnFi36KF/+3RG/N2pWzs/baupKbB360DMIIOfzL57DRUoqzNO1o4xODoT2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760818338; c=relaxed/simple;
	bh=rjjjgH3dWWCh0zsxJZpBZfIQiaVhuLV+VoMIZGNhDYw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QJESUyUPKwVIRQ3YpNYIubLzU3r5Ic1uwdaLGi1HGuCfM4Nb9iRc/kGilo2T1FtHt5pd0Kqoy6FPJCa0mW6igDS+m8Qp9foYgV+LQW09pK1Q24JFLPeCvJaW3dEXUD9elNYKDdd5aDUQIg3IWaxnXUrwLNDhV/hsM1IglCmYvl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WbdgnLNA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WbdgnLNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760818334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LS2upoXqu5x7TdfbgkzUtTm9yUG1+pOKkE1XXf9HHR0=;
	b=WbdgnLNADfwys/KM1Zl+lNnhoKdBbrBQuPvLS079fXl8fCjAEQXSfRSrEDff7z5Waw9NSh
	9kG+JCERSBSi6cW5BW3RCmufLFyYTjmuV08qebX+NO0xhK6dNmkAJz7JeMWBKMxS1mqheZ
	WL2TvnOE+Z3Y8G6a6bazGwRXmaQc6z8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-Mt63GyU_NVqvo2U5aUNsFw-1; Sat,
 18 Oct 2025 16:12:13 -0400
X-MC-Unique: Mt63GyU_NVqvo2U5aUNsFw-1
X-Mimecast-MFC-AGG-ID: Mt63GyU_NVqvo2U5aUNsFw_1760818332
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 368F4180057A
	for <llvm@lists.linux.dev>; Sat, 18 Oct 2025 20:12:12 +0000 (UTC)
Received: from [172.20.84.201] (unknown [10.30.45.119])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E865919560AD;
	Sat, 18 Oct 2025 20:12:10 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 137): Test report for master
 (6.18.0-rc1, upstream-mainline, 6f3b6e91)
Date: Sat, 18 Oct 2025 20:12:10 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <76238.125101816121300185@us-mta-175.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BKXYR3mP-DWSh8_gLRweeFYpJt5fhsrk1HEggUUxb-s_1760818332
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'io_uring-6.18-20251016' of git://git.kernel.=
org/pub/scm/linux/kernel/git/axboe/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2106130768

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2106130768_x86_64_kernel-debug_kcidb_tool_19796557_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/451

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
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]


Tests that were not ran because of internal issues:
    /distribution/command [x86_64]
    Reboot test [x86_64]


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

