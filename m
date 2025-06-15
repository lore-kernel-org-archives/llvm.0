Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238F4F9EC
	for <llvm@lists.linux.dev>; Sun, 15 Jun 2025 07:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749971592; cv=none; b=pzZ8zuKsVoY2uvAAVkkFX+iwu2iid+oPR/k6P12LnG+FjmVV9ruL2nKKUwl1WAXbac/F/P842xRDneUYQMBW3KaYAsEORbaOvM/VAhguHp30FKRfLnhmmxp61hKll+j0c19bXfvZjOTQMcvvmgrzqVLApCGHMbd77djVY3nfxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749971592; c=relaxed/simple;
	bh=L00JpVp4+cL+WfkV3+W6V5iGpVC4f4VxlkmG0w0uoWk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UyiUMrJjr+CiJDfEyN8CVTKy5lioMezkRJaNFtQbhy4BeJ/kDzDDfJz71rXTgmoEYGCAIr4eNJOY0vhpaqfg7m9C0C+Um0oXtFaGcYW08oUWKOmdN8KCsO29sjCrSdb17ZcW4czhbDuCATMdxutuSNjWDvMiPmxCfmStnnznDQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZwkfQ8mM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZwkfQ8mM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749971589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eITEyAfwMJMXH067WtNL9x9XO4xXIigRDnu/XgaNMOs=;
	b=ZwkfQ8mM+dUqgTzf8Gv6Lw5RqGX6QsgZUQtzh8ptc8POlLflNFK810ynHJY9v+kQPgadXB
	NkhScd7V1Dy7peFTfBLuWHOZvjnQVBjJeOZZ7ldVbYMMozgs1FXv7IQS9vOhguWmDSpuvz
	UeVaniAGvt82BYxem7mFTIYpOa49tV4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-601-AiQxFNIuM0WWDiDwVmbHaw-1; Sun,
 15 Jun 2025 03:13:06 -0400
X-MC-Unique: AiQxFNIuM0WWDiDwVmbHaw-1
X-Mimecast-MFC-AGG-ID: AiQxFNIuM0WWDiDwVmbHaw_1749971585
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 846BB195608E
	for <llvm@lists.linux.dev>; Sun, 15 Jun 2025 07:13:05 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 193A81956094;
	Sun, 15 Jun 2025 07:13:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 65 of 100): Test report for master
 (6.16.0-rc1, upstream-mainline, 403d1338)
Date: Sun, 15 Jun 2025 07:13:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <54402.125061503130600261@us-mta-601.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4W2YFewYJ-r3Gzs6IYSQotiR_91fC14Qm2DE7QKi4uc_1749971585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: mm: pgtable: fix pte_swp_exclusive

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1865477900

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: kernel BUG at kernel/cred.c:104
            URL: https://lore.kernel.org/linux-nfs/20250508051829.bdv2r72l2=
o5rsbni@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    machineinfo [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x, x86_64]
    Storage - blktests - throtl [aarch64, s390x, x86_64]
    Storage - blktests - ublk [aarch64, s390x, x86_64]
    stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
    stress: stress-ng - memory [aarch64, s390x, x86_64]
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

