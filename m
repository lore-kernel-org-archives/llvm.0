Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AE028751F
	for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 16:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755880391; cv=none; b=TQYCy4pgMW/nNQ2y3StirJuNyh5CpWSdN93PVNqN67Kve4htKpZ8Pcw5P88hgmQ9+brjaTha7a0awof0ov04UrcwE7VtzqRRinfbS2PEl863RtzoJuPOeZpCGUu4teovfNcBm6/9xBj4lhFmKVHlVCRWrsVB0uWdqM+DHkSHkMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755880391; c=relaxed/simple;
	bh=1Sj7/DPjj+ty126Tnij9QlaIDEzyvJjZ/CT777R/TOs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=h4QF3PcSZBX6q8Vs68nbTnoBhDU4sa1Vma7crwu3/uHyOKPhSweO95vEjqnfoAxMMNoruL6iww4jpPiXQfDhQGAPjGlIx9H6FpWomx0B+6itasVEZda/byWk7LI8sTNJDzKN6pRF+udSWoW5PHSVXObh2dI/PCbtbP+3jwbxyHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PE6yROCi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PE6yROCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755880388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9B8yYCevCV9/rb1yuNkbjcGtbLDJCrInvPfd7b9F/LY=;
	b=PE6yROCiS97iEv2ebai4/0RdfGBolzubPZdKyWAJVuFaNA8M8oj6HOGq+EhWvaheb2zzxN
	WkUievRYafwV+vWG+B2rpH2cFwmw4sD10N0AU+RiEaY9qAXLUDYh3MKr7J3I6lywyKqrmf
	4zIeqWwY/JNYuAjJX2uuACDlq9kpu+g=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-VdEMvQAxOpOnkUQSj4FZOQ-1; Fri,
 22 Aug 2025 12:33:06 -0400
X-MC-Unique: VdEMvQAxOpOnkUQSj4FZOQ-1
X-Mimecast-MFC-AGG-ID: VdEMvQAxOpOnkUQSj4FZOQ_1755880385
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8BED31956087
	for <llvm@lists.linux.dev>; Fri, 22 Aug 2025 16:33:05 +0000 (UTC)
Received: from [172.20.48.110] (unknown [10.30.45.91])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 237B118003FC;
	Fri, 22 Aug 2025 16:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc2,
 upstream-mainline, cf6fc5ee)
Date: Fri, 22 Aug 2025 16:33:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <09396.125082212330610268@us-mta-397.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LQf5xJ25NT8lpLuqEu92Ua0mFD5-yW43AGlH7EGsZzE_1755880385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 's390-6.17-3' of git://git.kernel.org/pub/scm=
/linux/kernel/git/s390/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1998883271

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1998883271_aarch64_kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1998883271_x86_64_kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1998883271_x86_64_kernel-debug


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

