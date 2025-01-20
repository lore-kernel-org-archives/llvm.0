Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896F82FB2
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 00:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737331329; cv=none; b=RvTKO6sAZ3OSX2kfGdU8uNW08u/46+3X17OiO8At/YJ0ZBSGat2AaB6bWBxovmJCkhc+YKlKt2Wk9VyaFAlohSqRqQ/QA8XcuDV9IZ2dFZ3bUintmkKHzc5gcnPz3xxmAQKZmridVPK85h47XLuTA4i4lhFNXhp8TD9VmJbt23Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737331329; c=relaxed/simple;
	bh=ydQ/k2moNJrLla4rslCdmFwqeTmKPjgsV6J96dLUtso=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iUdYCoz5LIns8AOB+prc5Bz+IM4fJWE2Jf8tlGC3nfWxBp52azqfQkLl5fCV8YsHJMGFFZiTfzrwFvwgvu8M+TWhM6NuoN4q6AwCvNenvhk+HvvDxRkA5hnXYxbNPEAFm1H5hfJJbxVKIkJGT+VCktfYySuXz58CCZkqEOIg5Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HbXmjT1w; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HbXmjT1w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737331326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=S/u01VlWOFe6+Rohb9A4YNMdE8giwubSF5XlWLGBQWg=;
	b=HbXmjT1woPeHW2fU2dyUrX6GRCj5iNwcwkUfJzIpojoXThHMDFyWkqkx7bO5uTo9tGWGYd
	V2sv6+tvFeRw4L9OCdG4l3bVeNo7v/RUBgpHrQvO2Vss/6Y8BBPRy9dLRlWa8ACAqcow+n
	zgUy3HSPXXc9eM3jgsDkPSPD2vXqSzE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-389-KYI9uuczOri_99PvacdjfA-1; Sun,
 19 Jan 2025 19:02:04 -0500
X-MC-Unique: KYI9uuczOri_99PvacdjfA-1
X-Mimecast-MFC-AGG-ID: KYI9uuczOri_99PvacdjfA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADE831956051
	for <llvm@lists.linux.dev>; Mon, 20 Jan 2025 00:02:03 +0000 (UTC)
Received: from [172.64.12.20] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3AAAA1956094;
	Mon, 20 Jan 2025 00:02:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc7,
 upstream-mainline, 9528d418)
Date: Mon, 20 Jan 2025 00:02:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <44831.125011919020400325@us-mta-389.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JPTdzmWzfZ8IaEFCUgMu210M05V_k4C_dvNiie2NeFE_1737331324
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86_urgent_for_v6.13' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1631683020

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1631683020-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1631683020-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1631683020-x86_64-kernel
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

