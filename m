Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522CDB640
	for <llvm@lists.linux.dev>; Sat, 18 Jan 2025 00:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737161590; cv=none; b=LohonzxCFUuzxPP5VAYhH4zwYzpVL93RWqa5P1Il9qPty19LV/ll0StPBMeAkI9QezdiUpLx8T1VCnGl2g7rxTGOGzYFlEgkPicJ7K+7/jw+e1ytSNXtbsxzdNvF4TSHB/jgvxI7yL3BRK21TOD9r/IJe/sVOaZahyG5x4ILV6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737161590; c=relaxed/simple;
	bh=IE3Ft+m6AerpqpaeXlKy8y2RB0YcLQaoK0V46iKq/8w=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MryGDBLdziQQNaFmeQpnZI3lU5p4/UL5odrJwz/3SViKf0sG0cO+gbTiqzoMVlavKz/y0Iagj1Dz+IOXji71w13JQ9ip3id/mEy7iOsMsoJh7t7HRjYkBmf6aYkTpLE67eucOq2npoPj4wPf0pbzyUZnBAJlxSBtIAcv8NZE/ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LfAY/UvV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LfAY/UvV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737161587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=elfrFBDS8na1e9y6lR4DjBd621g6n3vaAaflAOhIHg8=;
	b=LfAY/UvVzh9CboPSun9WgbuNHqsuRKMyxrxmPuaXPxE1wDbayRSfYomKzxgyyoOQPvPokE
	N3APljz0ev8xKWV1+3IdbyvGD51QKgkwH+gM05a4IEIZqJlmw2NLHlk41/MGfFGujQdvl+
	eqK536xsIVSXXFd7ctL5ksztDwYjxkU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-mNj8Ws0lMGiBUZlVEWx2YA-1; Fri,
 17 Jan 2025 19:53:05 -0500
X-MC-Unique: mNj8Ws0lMGiBUZlVEWx2YA-1
X-Mimecast-MFC-AGG-ID: mNj8Ws0lMGiBUZlVEWx2YA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD32B19560BB
	for <llvm@lists.linux.dev>; Sat, 18 Jan 2025 00:53:04 +0000 (UTC)
Received: from [172.64.12.20] (unknown [10.30.33.24])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 58D001955BE3;
	Sat, 18 Jan 2025 00:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc7,
 upstream-mainline, 59552394)
Date: Sat, 18 Jan 2025 00:53:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <31708.125011719530501062@us-mta-517.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z8GgsCq5puLrk7qSp-OqQ9aFEAs2tpTehWwDY2N2hRA_1737161585
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'devicetree-fixes-for-6.13-2' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/robh/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1630556422

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1630556422-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1630556422-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1630556422-x86_64-kernel
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

