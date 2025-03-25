Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C60E2F42
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 05:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742880793; cv=none; b=b0r5J9fvbIOChaLO+GlQmMqYiuL2hl2c04ZsR48iU/3Bm/9LJXCbFqtMqcErXAxfjdc/Vwn0eymoi0VqnmmH0EEHS15KRQhU3bSaS0OA6N+fe5j3h3RAYmwQmFvgxwlFWozO5tUICLNzTuG5EMP7+2EH5eO4oW8S9tfrjBFGsmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742880793; c=relaxed/simple;
	bh=DAo+daW9F7TLZt8vSJtJ+VnwsbbDYMBSohY5+u1RoUE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=oX8xsraQRHaXz10s22EQQJsXldvL5FeM+4lZOrmeINHV0qEaWMg7Zpe1G2e0MqaoWNIBvoIOdLFC5tPTS4aCzUJEXAvGpAbg5U7h+btK2gJ0wABQ3fR4a+yKXlUGQokyUAAe92cuFDBSOBSWGPv/NARh5+DWAuQdBqoWxfZGq20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N3xHcfvg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N3xHcfvg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742880790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3fTAHgE/OkFguOI14aFJTZeZzB1fkPWCx1hxYhI+Gg8=;
	b=N3xHcfvgaCGd8Gx3pahe/qqTnmZpkL4VqINoiBqyIyqSpI2g6Ovw4KQ0DPEcv4Fr4Sr64b
	hanNl/QikB0kFGAvaXVO2lKHr07Z73R8lNmczjLDNCw2qleefxZdBZbylpgj/FM7TNKJmv
	zm7g8DaUGyRgxbPNrYhyG50N3Xoieq8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-353-BCXgw80PNMigEfOZGmkWhA-1; Tue,
 25 Mar 2025 01:33:03 -0400
X-MC-Unique: BCXgw80PNMigEfOZGmkWhA-1
X-Mimecast-MFC-AGG-ID: BCXgw80PNMigEfOZGmkWhA_1742880783
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F34C3180AF57
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 05:33:02 +0000 (UTC)
Received: from [172.64.12.49] (unknown [10.30.33.24])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5D7031801A6A;
	Tue, 25 Mar 2025 05:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 3ba7dfb8)
Date: Tue, 25 Mar 2025 05:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <69890.125032501330300405@us-mta-353.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ha0b5zrLQV0KLR0EtwvkaFI4-xke0cJgMKHs2ywsyqI_1742880783
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rcu-next-v6.15' of git://git.kernel.org/pub/=
scm/linux/kernel/git/rcu/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1733277260

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1733277260-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1733277260-x86_64-kernel
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

