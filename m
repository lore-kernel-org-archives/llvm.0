Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A9718EB0
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 23:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742944388; cv=none; b=svR0jJXXL20/x3FvTsahg9VdBuRg6xvDs4x5UVow9eX1Kz9UX1v1wBeq7Mj8IOnJDHNMSGQ3DxVvGe4LSdRfpTO1ODsap6ayoFX11CNle778sLOTEdwf54yTsaoElxEgRlI3P+thT9MJGZNT+pwTKTw8I/KoHWOzGVfqu2TPiOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742944388; c=relaxed/simple;
	bh=Iq/elrbpR1uZ2hr/U9XSxmPSLTvUMpJtnixfBvbr5Y8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=W74YvhDVkBd5+RQTyEC2TnzQAOkSFqSamdp4UaY35cPAjgRCnXeOVqRlD4PLeBEWb3xarqIDTYziwVgpROR4vkp9+AekJEOThQLOBqLADEYNOQUvbs+O3Wu7LqKNFgKY5oGcplTIhEnD9jLF5EBEY9sQGP/Zxwx/MUTy7en75hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uw8PTv0G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uw8PTv0G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742944385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6UppM3IRpBJCdecdrVjgVpWlMLJlDROZ9nKw6bqvKJ4=;
	b=Uw8PTv0Ge9Jc4c3PwL9iaXpu/v/X++WeF0Y7mBN8kJ16Cno/AhbsV99u2/EvMsz5zMsQt6
	PeJATU2Cola5i10EdevJ6/3/OYbLdaQcfoj0Gq0nGxJlakQJHCG4CJgtSP4Ui4yThdpLca
	43uk66TvzNZ3R4TONRVTjagCtdpc7iE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-494-_mFh8gyvPVu9KYF7w2yNFQ-1; Tue,
 25 Mar 2025 19:13:03 -0400
X-MC-Unique: _mFh8gyvPVu9KYF7w2yNFQ-1
X-Mimecast-MFC-AGG-ID: _mFh8gyvPVu9KYF7w2yNFQ_1742944383
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0FE201801A12
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 23:13:03 +0000 (UTC)
Received: from [172.20.55.199] (unknown [10.30.45.42])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE1B019560AB;
	Tue, 25 Mar 2025 23:13:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 0d86c239)
Date: Tue, 25 Mar 2025 23:13:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <42409.125032519130301348@us-mta-494.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vqFkjZvR_NcpcjEEAHq44jP_Tqx589ryvNgBbJPfr2g_1742944383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'ras_core_for_v6.15' of git://git.kernel.org/=
pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1735132724

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1735132724-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1735132724-x86_64-kernel
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

