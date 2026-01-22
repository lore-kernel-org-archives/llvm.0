Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A216F3EFD23
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 03:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052790; cv=none; b=OdzwO2RRxGN3JEmhJYf56wLlsTpm48I+y9zd20qVNy9Rx4/fgyYpCRfhQDO2HQdz525txPEpaQTMEqAycQQICdhpuaiQPs/H9pfGvVTg58SNxhzwj3bSzGo7evAi2OaftMesiG7LeBxpb5Hp5LJ6Ve3kH/LMxNXOcR5v42JNLT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052790; c=relaxed/simple;
	bh=pbLDQ/AtuAVqtxfVJ59qUpXGF8Np9bfcm5FIEUNZeB8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VNErVT+yaI4tizKBow0RPow9prWbqCjknWoIdd/idZ/3yhky5rvSXF1jLmu1F6capzxKd6EIX8AVyyHgqB9O9x/degZ1Z/W6U64SBfUImM4GLSJaZhAscexD7hAFrbFypkrs7ICABPcwFFRGDZSGmvuhzAp1zabA80vHM9DBsTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=itlSKTY9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="itlSKTY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769052787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2OFLz6k4lR1QXZXXzCIzVDhiIjiMczOzH5BPDPlIVaA=;
	b=itlSKTY9quYom3HekrsTJP4a9D+LBNtgAl+Zu/7AmxYhIrj9RKgUSdT+eNBvYXp9ZVwAAK
	q9PJlmjqcpcOEu5Izy3laSvXuQawqffS3H33LPTvn0C2602e0CZw86bkfZ3XA+FCcNtRtj
	DPqd8NEmoLr9hQLwWM76yV316NKhY8w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-462-l4O869T2NYK0ZLWmbRVT5w-1; Wed,
 21 Jan 2026 22:33:05 -0500
X-MC-Unique: l4O869T2NYK0ZLWmbRVT5w-1
X-Mimecast-MFC-AGG-ID: l4O869T2NYK0ZLWmbRVT5w_1769052784
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 353E81800342
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 03:33:04 +0000 (UTC)
Received: from [172.20.12.215] (unknown [10.30.44.139])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DA7FC19560AB;
	Thu, 22 Jan 2026 03:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 81 of 110): Test report for master
 (6.19.0-rc6, upstream-mainline, c03e9c42)
Date: Thu, 22 Jan 2026 03:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <11089.126012122330500143@us-mta-462.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _8IDDn-qf60J8xunQEw_-TXShp1CWJm_7BjLdZjzJfE_1769052784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'dma-mapping-6.19-2026-01-20' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mszyprowski/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2274588874

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2274588874_x86_64_kernel-debug

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, x86_64]
    /distribution/command [aarch64, ppc64le, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, x86_64]
    Boot test [aarch64, ppc64le, x86_64]
    CKI/restraint [aarch64, ppc64le, x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [aarch64, ppc64le, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
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

