Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1EC2C21E6
	for <llvm@lists.linux.dev>; Sat, 25 Jul 2026 03:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949796; cv=none; b=pqfvvtX/dzRWQeAYNx/mUjVoJEwoITac/uMFk4Z/ENH1wIgpyQKL3JW3toDQuSgYE+9ilCbqI4Fh+Z/GjaJt5WM3PCV8fadaMHAmlxq1SyVJjkfLKISG1RILLDbE8oPlQ5orxp40fqipKJNKFv+AupaX0gBFbjKYANaARPEkVNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949796; c=relaxed/simple;
	bh=sxVOrCeJDdMEt1PwQ6cegfD0rrvxNv5cj/l0I6KQqTc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ib9fOgsWwZbNq8cV++F9WEdpRnmRv/ilJXLnTAJTQr+lWlu9bO0Th3J5uwVsDaEZqxqryEWwzM4TGwYWwaXZOgEvVvQdzpFikZqwhVyyihR6XAX7G8yvCuqNGUhby/OHCiiuBBwxXiPAdbPxsn0e9/VemQPtRjN9BIyO5O5r/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZjjkumTS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZjjkumTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784949793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZQaFO0fWDGLb5g2ngDH+8qxB7hTQwwXzn88FpMdUibY=;
	b=ZjjkumTSsrQa8p79x2lJ8enAdM3vkZhxNRdBq+ZYJz6LCbZQOBrZDGAH6aj2740py6NMcP
	NAZXiiVSWshWPGa+iPImwfvpObic0wduGuJa1i8dogbay1DuLv6EnyatU9o6PWIYEUISWq
	2dtg8byyyeWZJ83rn2U+oYFGMPK883Y=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-218-D_katFuoOcGg0f28awvd5w-1; Fri,
 24 Jul 2026 23:23:09 -0400
X-MC-Unique: D_katFuoOcGg0f28awvd5w-1
X-Mimecast-MFC-AGG-ID: D_katFuoOcGg0f28awvd5w_1784949788
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AA5B01800BED
	for <llvm@lists.linux.dev>; Sat, 25 Jul 2026 03:23:08 +0000 (UTC)
Received: from [172.20.176.224] (unknown [10.30.44.218])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 381C515B0;
	Sat, 25 Jul 2026 03:23:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 49 of 88): Test report for master
 (7.2.0-rc4, upstream-mainline, 48a5a7ab)
Date: Sat, 25 Jul 2026 03:23:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <14864.126072423230900207@us-mta-218.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: grzcBNcr0cI_L7671LcaNxJB11o_nByHUyel3Qb4NOA_1784949788
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'v7.2-rc4-smb3-client-fixes' of git://git.sam=
ba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2701538265

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2701538265_ppc64le_kernel

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, s390x, x86_64]
    /distribution/command [aarch64, s390x, x86_64]
    /test/misc/machineinfo [aarch64, s390x, x86_64]
    Boot test [aarch64, s390x, x86_64]
    CKI/restraint [aarch64, s390x, x86_64]
    Reboot test [aarch64, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, s390x, x86_64]
    selinux-policy: serge-testsuite [s390x, x86_64]
    Storage - blktests - throtl [s390x]
    Storage - blktests - ublk [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]
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

