Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935501A23B5
	for <llvm@lists.linux.dev>; Sat, 28 Jun 2025 07:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751097131; cv=none; b=r/l/qlAEXDEvjJkWiC8DfbsYm9Xg+2a6TKt4Iitslyo/uaHf6DPuWjKdNngRYyMPa7rYMgtZvVGOHpUTqtAncW/SXCxBnnQLBPIuFOYOMqzw6sgjFgDqK//hk+5ObF+4p/iZjugi6+ZF2onfH32wT5snx0Z5Zik9V2Xwjz8yIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751097131; c=relaxed/simple;
	bh=Yrple2uaafZllUXBtZpJ9FNoKG08ndUSz4sQ4Oo3Sx0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XOEFG/44NQ0xGEpyKy9amwbTQCVo4m7Fcr/sO7nQUkaijdNtIismMZy7bsTW3HflTQzokniugDVnAc0FQR8AYjVucE43PgX/SrL/wi1Oh94j58y0vpXpEXKwpmjxh2E7mpk0iBRCRzVbm1nzxTgA8ckYrugwFQ71HylnDzDA6jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLrHtQ1f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLrHtQ1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751097128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LxJdmlWvSJt1zPUfQSIB3Gk0lOsmjVaB43Wv6hs3g3c=;
	b=XLrHtQ1fVY6blJT97rlJF5teXApuP9vfMOh1oK3uRTk+luDp7RsasumblFf6K8AnsIQ2Kc
	1LBqhPGN2xYHThppyhZR/Uhf6ph96LQqwjNbyV7LqBP0XsZFjLixMFeR2dB00Of6mTWN5y
	JhzVFJ/Uma83SP90SOIaXTGUMa3IVpI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-355-8JIq5wVJNb6w2pBpPCbY0A-1; Sat,
 28 Jun 2025 03:52:06 -0400
X-MC-Unique: 8JIq5wVJNb6w2pBpPCbY0A-1
X-Mimecast-MFC-AGG-ID: 8JIq5wVJNb6w2pBpPCbY0A_1751097125
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD2CE19560AE
	for <llvm@lists.linux.dev>; Sat, 28 Jun 2025 07:52:05 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A7801956095;
	Sat, 28 Jun 2025 07:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 6 of 100): Test report for master
 (6.16.0-rc3, upstream-mainline, 26fd9f7b)
Date: Sat, 28 Jun 2025 07:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <08646.125062803520600287@us-mta-355.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5Ps-2QjMUMreSIK1R4pQFWdZkqWWTnkUSnLUUft-R9M_1751097125
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
    Commit message: Merge tag 'cxl-fixes-6.16-rc4' of git://git.kernel.org/=
pub/scm/linux/kernel/git/cxl/cxl

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1895066887

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
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

