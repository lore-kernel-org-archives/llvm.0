Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58425FA32
	for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 23:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612730; cv=none; b=OC0Cih5YCm4cv/3CQAn/PVn0iZh+pmJKSgUN7ocd1li79yBiLVuwXO6CV786ZZb1tgPWKNGtYmDuRu/EoA0h6Iax/+jLOfbOcO8pln34BBCtlZCS3Q2iVPGUTsKjtyCh38bEeVZkt200sgZPUbHi1SHDeVIcIzwZL2+IVvi7toM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612730; c=relaxed/simple;
	bh=1tv4CVF0BTPDiQc+FHfRl0DA7eR7bBhpuEUfOTZRp4o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=RIitTQ76HCq/0DGVYwKsilSvAq9FKe5a8fUdsLQCOzLidcNo9z81DWO/yjANRO9O57Se812bT3zQZJ4AuzIQqacPluYAlPVT48/loFlR4dQUwdr7qMmLTlHOsavZ6swynsUn6YU5c15f5D39B5Vs3kkojsvrHutnRFdZ0giSF78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gZEpuok8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gZEpuok8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740612727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BIufb1dQoP7Ip2PwFIqgOtq78dAhM193YK+ez0BPrWA=;
	b=gZEpuok8Vfpplih4V7OK62DaQN3nZLE+FnXCuwnGvFEm2BnlWQ7297TTbpy53NcHOoIK1n
	OlD7lXFqZCCtBKSiVnim6BW0ubC+BGhwwwlvs/udm9QkqAtOOn030QGdxstroAokN0Bmr+
	Arn5f6XCw/Jky3Vfh+PY2zVjC6XIVMg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-jK1jVWa4MaOm895y1ka_hw-1; Wed,
 26 Feb 2025 18:32:04 -0500
X-MC-Unique: jK1jVWa4MaOm895y1ka_hw-1
X-Mimecast-MFC-AGG-ID: jK1jVWa4MaOm895y1ka_hw_1740612724
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8F291800872
	for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 23:32:03 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 75ACB1800359;
	Wed, 26 Feb 2025 23:32:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc4,
 upstream-mainline, f4ce1f33)
Date: Wed, 26 Feb 2025 23:32:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <99598.125022618320401715@us-mta-313.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mtHayUCjnNJ4tfVkTIOUnUSDYdZWkTkFOMbqoR09MI8_1740612724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'wq-for-6.14-rc4-fixes' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tj/wq

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1690527917

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1690527917-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1690527917-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1690527917-x86_64-kernel
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

