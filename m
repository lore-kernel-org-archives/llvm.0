Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C421A27732
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050146; cv=none; b=MYouLwmrEUYxS1lxfaI7PT5n+1s5GqsJ6FUQLNDUT5a7z0l0enmwB6QqApYBaf/LeJvmnbGSRE4FvISSwMPDqwvuJyd7sIP/EozR4NGkWrTYRPstFUk6/ZZHeb2foj0Wbg0OS+60Y8od42SSUCBZqEo8K6AuGhEfVY9jY8Tl+Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050146; c=relaxed/simple;
	bh=KOge0cvUuAxAhrJbOqg7qT7puQP7wAnTN0Nx/941LkY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iSwR+adTudfmOK9DwFJ4sux+5aOPC6pMFywCK7V4zt42JMtnKZNTAHud4twMwWSCxewvOif1clLC+95+SI6tqJFkXITQu+O+R6RBQlqEYFvnilK2oMuC6WItm1aXWaWQPVV8Sf9w0IYSm1feHzvvTrWF/ued6rcqiKy5sJ+0KZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A7AT7ftr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A7AT7ftr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=giZKXCmvgR8i5f5FdFZn7tD8QZmoG9IBmKjvxuITdx8=;
	b=A7AT7ftraMWp513ZkIUXROBXXtG/jZ6WkWZEVTnYwbdQuaQCPesbxRs8CKpuEFkrytdkES
	sCmKdUMCcThxm/UNWA8Um5wVx+nhTJlEGinYSkwNeDV4CBYlKdus6nA0D/PiVMhX2gxZDJ
	0sMCD5ze74+goiWveOaeBwnwGU3fu/8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-586-BE1QWnJLOvWc9lZZrruElQ-1; Tue,
 16 Sep 2025 15:15:42 -0400
X-MC-Unique: BE1QWnJLOvWc9lZZrruElQ-1
X-Mimecast-MFC-AGG-ID: BE1QWnJLOvWc9lZZrruElQ_1758050141
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92C071800372
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:15:41 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B6AC19560B8;
	Tue, 16 Sep 2025 19:15:41 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 18 of 137): Test report for master
 (6.17.0-rc1, upstream-mainline, 0e39a731)
Date: Tue, 16 Sep 2025 19:15:41 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <96093.125091615154202218@us-mta-586.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eNHzCXUTc43OUWjgi9V75WOvbnv1k8UNsT2qK8HwmIc_1758050141
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.17-rc1-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1980274479

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1980274479_x86_64_kernel_kcidb_tool_19351176_42
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
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


Tests that were not ran because of internal issues:
    /distribution/check-install [s390x]
    /distribution/command [s390x, x86_64]
    /test/misc/machineinfo [s390x]
    Boot test [s390x]
    CKI/restraint [s390x]
    Reboot test [s390x, x86_64]
    SELinux Custom Module Setup [s390x]
    Storage - blktests - throtl [s390x]
    Storage - blktests - ublk [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]
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

