Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE361A23B7
	for <llvm@lists.linux.dev>; Tue, 18 Mar 2025 19:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742326330; cv=none; b=AjJkBmAwy51BbKJN23q01rH+WHSYZ50kEX3JLBPjH6s9UtH2gRIWXyz5iq8w1rfjI7Tdmswj2aioPOPVXXnoq1V6fQESfry97N57ECJoq9RUG39EoOUvFHcqk2b6Ux1XgC5qrN9c5Kw9LYUhyiBYav0My7EVKjzIM8v+nplzLGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742326330; c=relaxed/simple;
	bh=5FY1+Q71JbCYMxSIEm24c8uuQUUKw3MHmXUfscINB+I=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VKVQi58i7KKrBI4XXnEg55s893LFrCwkQxW6Zhxbyn+dDITcw5D/wfHPiNv5HA8HyNngqv+3xK6ZD2k6t3tRo20BVhSTuC8d+5L/NtwukQZZaH1qL5p/0pE53c0+T262PLaRulCKNKMy/rJVrsXc+jtCwaBrzZfZeOlCOgkpfJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FHiOhRNW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FHiOhRNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742326327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7kXRmJtnJtCGMlBN3/opBqQOZFlHYoAmM+pERkc1Dhg=;
	b=FHiOhRNWsVidOnVgq7dL+tWEWlxvkivEMc7SugQtJ7N00bzKlWIGcpmSLbT5Houeaw8Fwp
	Tdfjx5vgRd/Md0iC62LlXBsNaOcTvBki3+n144Zfkdnys7iQoN5i9cssjP/BDpW/GvPail
	uCrk/O8Kb1s+DrbgN4BG6A5KFKpujy4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-222--zXj0bJbP-KiR3BqRKTqiQ-1; Tue,
 18 Mar 2025 15:32:06 -0400
X-MC-Unique: -zXj0bJbP-KiR3BqRKTqiQ-1
X-Mimecast-MFC-AGG-ID: -zXj0bJbP-KiR3BqRKTqiQ_1742326325
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E784180AB1C
	for <llvm@lists.linux.dev>; Tue, 18 Mar 2025 19:32:05 +0000 (UTC)
Received: from [172.64.10.41] (unknown [10.30.34.106])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C0B8C19560AD;
	Tue, 18 Mar 2025 19:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc7,
 upstream-mainline, 81e4f8d6)
Date: Tue, 18 Mar 2025 19:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <15506.125031815320600467@us-mta-222.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: baV1lmOszajY4VM_KTVGFRKl3SEymrpqyGcYpMsCrE8_1742326325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pmdomain-v6.14-rc4' of git://git.kernel.org/=
pub/scm/linux/kernel/git/ulfh/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1722998210

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1722998210-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1722998210-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

