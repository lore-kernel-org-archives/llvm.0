Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FAC1624C0
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769416390; cv=none; b=BzkKB2GoElrJdLgEepAh9I4osx+G8hl8+jkFMhU6knW/LrwN+Y3nQWAiUrzu++9EZn+jZwlxNuS9aq4uNCBhMcHcIxsqAl9UuiiyHsdJKLSUSbfejpX44Hk9nPk8ScLJhTLBURrInVn5C+EqBdL5WXBb4Legv+Zdc+LkHsv9Obc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769416390; c=relaxed/simple;
	bh=PfgoTN71hUihdPPQCL7JgTibwTnZ2EivAx2x5YgDMx4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RwEk1HKfa0ateYGIG7dnKoayIS2S3shzCSkW0qLI8cHinswc9547reYU4yc7TiCt+UkX9Dnj+Xod3N3iW3me+J+LhwirUqfQJRAkbQOZiL6LIuHWF3+hlvjdtAvaW1MNZWXSLLL3vpPYVwVEwFb5E0TLPFZdTuJ+T+Ef5dyok08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q6G0VhW9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q6G0VhW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769416388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w6D+Vl3Jf0+b5DtzUt9+3LABK2HAC6KsscjTz8YJR1o=;
	b=Q6G0VhW9Hnn2zaYG2UjqcnYXB4auKHeO3Z46w9ZwisRUOy6Fo1zEY9FgbRfFYGHyVXKRZ7
	0wBGB7P0D3GFbYt+HBEO2mk1XpIbaWfmruUCiartjygdfjSDGI5heAnu2xmVMs+mEHzSlt
	ub8+6KKZ4cBPCYxFxAwwsnPPrrPh7fQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-q0tPDErKMQi1iSvA11SAoQ-1; Mon,
 26 Jan 2026 03:33:06 -0500
X-MC-Unique: q0tPDErKMQi1iSvA11SAoQ-1
X-Mimecast-MFC-AGG-ID: q0tPDErKMQi1iSvA11SAoQ_1769416385
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 47DB01956054
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 08:33:05 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BD80A180049F;
	Mon, 26 Jan 2026 08:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 84 of 137): Test report for master
 (6.19.0-rc6, upstream-mainline, 02377779)
Date: Mon, 26 Jan 2026 08:33:04 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <36171.126012603330600276@us-mta-622.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oD_l950EX0A7X5H5vZMWH3qyI7TaTLoL4S51NmCsaHo_1769416385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2285331680

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2285331680_x86_64_kernel-debug_kcidb_tool_20524879_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/309


Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x]
    Storage - blktests - throtl [s390x, x86_64]
    Storage - blktests - ublk [s390x, x86_64]
    stress: stress-ng - cpu-cache [s390x, x86_64]
    stress: stress-ng - memory [s390x, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

