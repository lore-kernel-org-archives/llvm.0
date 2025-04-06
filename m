Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A9510FD
	for <llvm@lists.linux.dev>; Sun,  6 Apr 2025 00:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743899590; cv=none; b=Z9+7fu+ZX/fDs1H99dLpNuTZBbZSKChMSaMPaBRnNzwnn/nnNRFaWFg1hF5J4hnDlQvNsVsHs6KSF3CbB+AxkEijq1WY7jLISaMEPYbuDCNoeLtwZLxlEqXjHKBnb0ey1wbDNep9XO2bAMoc/8HvkGlQMhKxasyiof/QbXzGQAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743899590; c=relaxed/simple;
	bh=72qApDyqSasvnxRDt4El6IZoq5s8oCsrhoCPUtBzg+o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=dwkhHd4R+0lldk2A78h4k41eiLm+rchEsG2GmucwgRc4PcutpxSKD0Q6dWkCjxmUAzrc5c/MRmTdzbkSQFH/SjhTxt/UdQKf79KrpIthLN4Iy9BoaSeaG2Hkm8ffdvjazvuO3IsXWb3cFn6cL29PKVBWf/VbmXtU3ZmEJSKuEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jz5oHLiK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jz5oHLiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743899587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2596NNH+09qI+jGiIuytsLT5VEugL83aK7804FQxC40=;
	b=Jz5oHLiKz+c5Y5G8egD+S5TmnG2wWmZ0uDB3aOhuDj1OtJGMfM032VseDEGAjNukw6Xrqu
	OfdPIPIyHLME2wTbmBaMSqY03NXRIAlfylzW/gaZovzRw7txDI5YfC/qc7ctAlYBHXbow2
	HoGuHqR0m7sgwIqWAbpHP3EsFVs0fMU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-35-4smshD1aOqmZ4WQvdewEmw-1; Sat,
 05 Apr 2025 20:33:05 -0400
X-MC-Unique: 4smshD1aOqmZ4WQvdewEmw-1
X-Mimecast-MFC-AGG-ID: 4smshD1aOqmZ4WQvdewEmw_1743899584
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7CB32195609F
	for <llvm@lists.linux.dev>; Sun,  6 Apr 2025 00:33:04 +0000 (UTC)
Received: from [172.20.219.140] (unknown [10.30.44.44])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 89C04180B488;
	Sun,  6 Apr 2025 00:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, f4d2ef48)
Date: Sun, 06 Apr 2025 00:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <07713.125040520330500165@us-mta-35.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3Ri-Mt8EvsD3FDLAvKAzlOH_xWfe7UrYqjGIXnLwwes_1743899584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'kbuild-v6.15' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/masahiroy/linux-kbuild

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1754082520

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1754082520-aarch64-kernel
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1754082520-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1754082520-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1754082520-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1754082520-x86_64-kernel-debug


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

