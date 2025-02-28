Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BAD23DE
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 06:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740724389; cv=none; b=aTL6Yc0QJaRPDy69mYZnMD7O8Ds6P6mrThEkBIZAkw7SadKplvVPwo+jFNVp5KvSwSXIQOvCmGq8+AqkL++vdZGKrptMjxVOyu14lW/q7bvv0nugfIDQs262c3XNadr9oDSlu/h0dkC/td9C5jxtPMRBMjysBMjWOT0a3khE0y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740724389; c=relaxed/simple;
	bh=Wu4vA/1dYv25l4KnanYskSTfI50ne/5QlJ7A/LV3bT0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=IMKIbQatZmGJbvLoAZm8/X3bOQNajuLhks4AcYW0PH57STOvQbQCy291OqOH1TrNaZK0W89Wsjl/EfxVmVLZQNsXdFK6O8o0M3uLiHR2xj7DTnIuEx3ny7X+mlt9sKuSgy9HKjiqH60Ibd1SQtmYBZ3MB5gN1haw6M2uR2ngVVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dkS9Jfkd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dkS9Jfkd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740724386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=saPm/zbw6sBy7wUOyRjCQDv/9Ef+X3IALKu+xfLJa5w=;
	b=dkS9JfkdFD1mKLFuYHq56yBpOSn9nei+XbSzASw6D1YRIcIpx/VkWoAAVREXYC7dXtOVFt
	H5UMhTk1PC2wh0WC8Z6q1j/qH25cWzm8btxkGfbf9ed3j8MxuJJipH5QL/ucNgVBSvjM28
	fKKgmVlvkTdY0AQFc/HU1AdVjc/74zg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-JduAHZX7PWmf5T1i1P93iA-1; Fri,
 28 Feb 2025 01:33:04 -0500
X-MC-Unique: JduAHZX7PWmf5T1i1P93iA-1
X-Mimecast-MFC-AGG-ID: JduAHZX7PWmf5T1i1P93iA_1740724383
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 588251800878
	for <llvm@lists.linux.dev>; Fri, 28 Feb 2025 06:33:03 +0000 (UTC)
Received: from [172.64.10.27] (unknown [10.30.34.106])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF64B300019E;
	Fri, 28 Feb 2025 06:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc4,
 upstream-mainline, 76544811)
Date: Fri, 28 Feb 2025 06:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <44794.125022801330400153@us-mta-574.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AAsp9_eIouXYkLmJe5W5osnfBGzWtUu09y8rTpW5xpA_1740724383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2025-02-28' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1692792264

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1692792264-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1692792264-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1692792264-x86_64-kernel
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

