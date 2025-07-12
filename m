Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E8317F7
	for <llvm@lists.linux.dev>; Sat, 12 Jul 2025 01:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752283391; cv=none; b=QadHIhQGl7Le66ZcllaUkxbxu/k++RKP1nVxexeeLthjJifMenuAKlG3x+9NnJO906l22azvXG/U5lu3y9WTZTXEfDXqkTmvXmIt1JN81YMan25vPQnc7FbPvRvlhb+H2bdF1E4mG2m+9VP/R7DSxVk/+ErSJexfSdj+a1wCpRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752283391; c=relaxed/simple;
	bh=aUNb6N3RK3ap+u0Ysfn+TN4/kwnErDMsna4TbMe6FCo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=nuuTgOcCJ3q5zXuT6qULOphHV1LU/Z6ZrPIXKWjKykm0f66rh6TeCQbfkWT9rnn0HwHuDjIq3XFlW35bXXD04XfOKLzq+vlxA4cjoFuuazbV+5VHa3R24zEbG3TavTNveqUNvk/kHKJhSF9WdBZLwpwqfqIPfXTuCD+/xCT7ljs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bs/7WxIx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bs/7WxIx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752283388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PP6V6t7xBGE7Ki+U7FcGhkmwCOXw/kbVREjb1j7HaBk=;
	b=bs/7WxIx0pRhFUO+qR5blefhpbhzoTivLnJaQeyBEzLtN6UaOcNd1pw3t0YCQUGOHqx7qL
	Au7jrTXyPHgatiiOu1yKZq1b/0/lY+b/9NQNfMtyqghYsvw1RQfPh6vZv0BI+PxnLG4KQQ
	pQbjwbQqRivGjjU55buzeeZjL2q7HPg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-398-tD-wFAeBOlOFvtI80Lq86A-1; Fri,
 11 Jul 2025 21:23:06 -0400
X-MC-Unique: tD-wFAeBOlOFvtI80Lq86A-1
X-Mimecast-MFC-AGG-ID: tD-wFAeBOlOFvtI80Lq86A_1752283385
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BAEDB19560AA
	for <llvm@lists.linux.dev>; Sat, 12 Jul 2025 01:23:05 +0000 (UTC)
Received: from [172.20.236.189] (unknown [10.30.44.207])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6CD4A1800287;
	Sat, 12 Jul 2025 01:23:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 79 of 79): Test report for master
 (6.16.0-rc5, upstream-mainline, 40f92e79)
Date: Sat, 12 Jul 2025 01:23:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <47544.125071121230600193@us-mta-398.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MZTJ9bWAm1VWIb3C3Xu4VVgyHfrKWvrp7_We-HiFJHc_1752283385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'block-6.16-20250710' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1921782688

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1921782688-x86_64-kernel-debug

Tests that were not ran because of internal issues:
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    machineinfo [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x, x86_64]
    Storage - blktests - throtl [aarch64, s390x, x86_64]
    Storage - blktests - ublk [aarch64, s390x, x86_64]
    stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
    stress: stress-ng - memory [aarch64, s390x, x86_64]
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

