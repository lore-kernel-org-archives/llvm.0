Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903D932D5D4
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050031; cv=none; b=uOYTtkYroLD4h7l2YBtXmuJqzmDOFqYv7DI32a6MykD+D8Fe5IRmlopApPunuWau3k3zrzDIxR7oc4BxeIhgw8MYotWM9hWgAxZQAFHaAh+9YAap7Uxp95ekPeTF7iCqdbP99G7KwiHnJYN4Fzu1ISGwyxhkiceZHM/ZKUdoXFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050031; c=relaxed/simple;
	bh=4DHBUNLcmwYZZ1x4uOBxl08GrFAyWXTyuqcxVrLbIoU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=c2gykJLTD4Zr1kl64xFrncUcGvtTm96KVECLW1bZ4K8Yx4k//3+m2Qn0CZZ8JuLh3qoa2QgiGsDcvqXXMd37csyAxXxXqpVT34Qy/ctCHN8HdY9tHXzNJEfUaypzk2bKhd54NQmiNyRRgna68mxX3XlZSEO9/kwWI6oUMoLTK/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U6XvGPtF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U6XvGPtF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R63s0kU/1ZdjN4Jmd4YY0EzxiC/U1SdA+G8FkhrioIg=;
	b=U6XvGPtFfqjlWYxMXu4V77w2LvCAj7AJijWzwz97vjFvYuJN/dN8y/c/c0+gPgJpf9qNLY
	djPFikQkxcDDpoQH/wHIv0FDrNS8zpSkW0w21RNx1bOtdLQFt4q/byzGrr0tX7x4xSCpAj
	RJl6t+jmW7NUvUd5VZ+s7HIecdETfJI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-Qj-FCflOPUCkqdSmOL5z-A-1; Tue,
 16 Sep 2025 15:13:47 -0400
X-MC-Unique: Qj-FCflOPUCkqdSmOL5z-A-1
X-Mimecast-MFC-AGG-ID: Qj-FCflOPUCkqdSmOL5z-A_1758050026
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 929B118004D8
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:13:45 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DE61A180035E;
	Tue, 16 Sep 2025 19:13:44 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 19 of 137): Test report for master
 (6.17.0-rc1, upstream-mainline, d0efc9e4)
Date: Tue, 16 Sep 2025 19:13:44 -0000
To: bgoncalv@redhat.com, cki-project@redhat.com, ftjahjad@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <30542.125091615134701075@us-mta-17.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fvl2X82YetXIRk3RonLK7sk4i_s_7ppslwe-unUk8Ac_1758050026
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'xfs-fixes-6.17-rc2' of git://git.kernel.org/=
pub/scm/fs/xfs/xfs-linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1986718080

One or more kernel tests failed:
    Unrecognized or new issues:
        /distribution/command
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1986718080_s390x_kernel_kcidb_tool_19375697_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic: Kernel panic
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1986718080_x86_64_kernel-debug_kcidb_tool_19374625_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1986718080_x86_64_kernel-debug_kcidb_tool_19374625_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

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


Tests that were not ran because of internal issues:
    /distribution/check-install [s390x, x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [s390x, x86_64]
    Boot test [s390x, x86_64]
    CKI/restraint [s390x, x86_64]
    Reboot test [s390x, x86_64]
    SELinux Custom Module Setup [s390x, x86_64]
    selinux-policy: serge-testsuite [s390x]
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

