Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F9243968
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050284; cv=none; b=XRQpMJ9q0QQW7e4XUiQq8LF0D3WT/7xiA4oVTwEerdNAaPWUc4FMXgdYbqdoPgjCjUFr8WUFckZxcxU5EB4YOwaKkox7DphSME3bsAcP2lQ+rMWLTENm7HiXlvI0xYqv6FvsSsvorqA+uKUPgGvYqDZwHnfEWjRsfIlnV7R782g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050284; c=relaxed/simple;
	bh=KLo5pfLKGjz5QuKqDH1rN7I6x/MWh6J3vvvWy3VO5S4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ig0Q/uxB9r+XJzTx6reKNr7qvCb8RsSQMR37mDdBmLtK3Dwwth/73FizwagTtrnO/RSMi+dSNuQHjtXh7rhjzpMtJETScSHyp5kE5N4u6G/TNTDvhrBuuZgjWwFIZPzgiqmfYSRoyc6k3ru/R9K8v+FtNf/knsCzNE2mjtUwjnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iJvFY3Jj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iJvFY3Jj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NjWDQjYN6Ziegvi2NZJwpLzYdoOMtpvWRFOdr4gx0tM=;
	b=iJvFY3Jj8Jq8i3SyoV6yMSXyetqgZu4Cz/pyfqiGJfa/cGivzccTUgGufd6imHQ8JubQ4A
	hGugFDO5Eh9ufUhfzkvxO8IYcayj3ZejcShUdDGDrqS8E6VoPVIjkc2UZtXO+GZLy98Fy7
	ydhacmPWN/SKZZ4wL2Rel2Kmj6aENMw=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-vJKPMVYrOy2VOrHg5kGFJQ-1; Tue,
 16 Sep 2025 15:17:59 -0400
X-MC-Unique: vJKPMVYrOy2VOrHg5kGFJQ-1
X-Mimecast-MFC-AGG-ID: vJKPMVYrOy2VOrHg5kGFJQ_1758050278
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6738D1955F29
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:17:58 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BB7CF19560B8;
	Tue, 16 Sep 2025 19:17:57 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 12 of 137): Test report for master
 (6.16.0-0, upstream-mainline, cca7a0aa)
Date: Tue, 16 Sep 2025 19:17:57 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <26859.125091615175900911@us-mta-679.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sirqhwiDy4ozijRHaoo2596ZrShqYdIg8Xm-7vR7g0g_1758050278
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.17-fix-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1969992103

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1969992103_x86_64_kernel_kcidb_tool_19305285_33
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/221

    We also see the following known issues which are not related to your ch=
anges:
        Issue: selinux-policy: serge-testsuite: FAIL: git clone https://src=
.fedoraproject.org/tests/selinux.git
            URL: https://datawarehouse.cki-project.org/kcidb/tests/7555723
            Affected tests:
                selinux-policy: serge-testsuite [s390x]
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
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
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

