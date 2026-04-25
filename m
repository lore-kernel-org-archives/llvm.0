Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7304394461
	for <llvm@lists.linux.dev>; Sat, 25 Apr 2026 10:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777113791; cv=none; b=H0ZMflKbMnsuc7sr64G8qimlu4yBWCsK8z4dRS80A8q0Kib0Wc0T2pNaYb/94Hq4OnWGCj+7TaXO43PPEGuj1X+WsvRWy0FkBv761YGUfXDGdxaozv7l3x+SqliWGUaV3ph1/sjNtn5cIjVAkpLgosYHmBwYSUWaCqTYcOaQduY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777113791; c=relaxed/simple;
	bh=4y0XKTCTk1HqZ/qpekaYcXfuPaPIBAfVtNUTgEeCCZc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=WNb0IFep0q4TYlcHMizl6dnk9u9VkXepsITzaOwZIFYWhB4xoev10kfCoXuBboeyD9pufS0IMNRcvIDYx1HD+1NwPgEn2NVSIwqs+2q7otq2vwiDadIwXGGEjiCBFaSGzcQ5IkhAt1OvYNaghWDBRVZLjIh94tXHtezU1PEgbQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZUHwnyvb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZUHwnyvb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777113789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qmj/34AynL/4UwjRQoMvsNBFcipI8p0A4Cka0ezHikk=;
	b=ZUHwnyvbdcksOZR6TUJWe6LOcSqUmmDSNArt1tMsSurqdTtm7YqQmFgK4UNpkBgNR9ss2w
	AnUi553vxmI2hzL7nen8H/gH5b7kYtZkWqVVfvMF/OTID/flbOOl4oVgIBtivDWSfIiMMc
	2wPEOSrzEbcc0lunAx4A/YSKIb0Ze/g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-683-EwD24hdoMbuLzasz627GoQ-1; Sat,
 25 Apr 2026 06:43:07 -0400
X-MC-Unique: EwD24hdoMbuLzasz627GoQ-1
X-Mimecast-MFC-AGG-ID: EwD24hdoMbuLzasz627GoQ_1777113787
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D34811956095
	for <llvm@lists.linux.dev>; Sat, 25 Apr 2026 10:43:06 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 41DE73007572;
	Sat, 25 Apr 2026 10:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-0,
 upstream-mainline, 27d128c1)
Date: Sat, 25 Apr 2026 10:43:05 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <60655.126042506430700805@us-mta-683.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v8dD7gAgIePfG2SSN7M5UPU_QmZaQfIiGzI-1H42QGY_1777113787
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'trace-ring-buffer-v7.1-3' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2478634436

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2478634436_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2478634436_x86_64_kernel_kcidb_tool_21171049_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

