Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2661B1D5AA7
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 18:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740162131; cv=none; b=fq3EN44rGYVyP+XfW25Y0I8pSb0gJxD4fcsDjImmfI0zxafr9FRk12KdB+ddJfcoPLuBCzEYjHqSB6+BAhoaBzO4ezlOUu4pyuBREq4hwEnHkGL8oOeu6iDvA4rlOVqEYMEIObWR0fhtxczfsImhJo3+OkGrVZjNxs+7CfAG2mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740162131; c=relaxed/simple;
	bh=lkM8HLuSbGfiB7uUoVScWoExlv4DHYAOq9ArHPXfRTw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=DwsmBxkkyeu5ZZjSkPIWUdf0Jcjah2yuxZkp9xra/R3oScJ4L5c3ymvM18rLSCy4rpZ5qrOoBm3BA0SGKp5GepCUreZo3ihdP+eKZ44ccC+jGmJlBXoqncA+u+d6sINBgaok+5QNQWxRl4tWTT/F+RboFvzR/OPMaNwO/n1EP7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KE1bYZV+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KE1bYZV+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740162127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G5E1m0c5j5digt8+v9mE0sJVPlvBPIZZ1kbBBCSwKGc=;
	b=KE1bYZV+3Tv/Gst7DxXvEWXNC2egiRt8Rlzao/WupEEVHGSjKwdZaljeFi/vJhTTIvB2fG
	rqWe+LGIZsID9XqyFNzPlcUeDdN5Hbsp9KzxTf4cG3E21JEkU5gmIC+BxAyR38Fui5t/H5
	ptlSlApUR2YtSNP5C/oLDlzH/pO9PXE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-CHvGGfccMkuyG-YlInTJQQ-1; Fri,
 21 Feb 2025 13:22:05 -0500
X-MC-Unique: CHvGGfccMkuyG-YlInTJQQ-1
X-Mimecast-MFC-AGG-ID: CHvGGfccMkuyG-YlInTJQQ_1740162123
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9B44819783B3
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 18:22:03 +0000 (UTC)
Received: from [172.64.3.45] (unknown [10.30.32.189])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2CFFD1800358;
	Fri, 21 Feb 2025 18:22:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc3,
 upstream-mainline, a3daad82)
Date: Fri, 21 Feb 2025 18:22:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <89773.125022113220500527@us-mta-192.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RNBB86RfSUNvUVKw6QgmMGkoIjlyxq41800HeJTXcc0_1740162123
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mtd/fixes-for-6.14-rc4' of git://git.kernel.=
org/pub/scm/linux/kernel/git/mtd/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1682876851

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1682876851-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1682876851-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1682876851-x86_64-kernel
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

