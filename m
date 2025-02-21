Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E497C1D6DDD
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740108131; cv=none; b=cOy86GE27yQywILRvvDMdo52QMnn41Dq3wnZ3Lj3db7Bbbl6KWOTPO/Tw9ImKORxqRoO22ycEqnmAPjPCDOzDA+7u9grpD2xzyEcLAVjsf/g7fGWnXFIr4PYvUnIgDgWOEM2iL/y4cjcFRo0NFOsuya7IIz5txu6T/Fq3ESu4oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740108131; c=relaxed/simple;
	bh=W/nfQrx4pSzdRxNczpbnvEmFznphe2nQCRpevh6D3GQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ewvrev9XbU+4z+DADbfTZ9TljWWwCUX6cMuKyNmYSPhyEWNVD1ASJbIbvfI53Zx52n3vwJ0ofCi/sT5c6ix8KeUneFMzncNGcjb2bQUjoU47R0guWIDYtOzFS7/LRD+gnE63gzlNRzVCEkKtVCq1aivUhadcIbAF429Ek7EoGHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tpym3bYA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tpym3bYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740108128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AOyudPs3RV98OR4WJEIJ3xkUMx9FtiwEvb6AA+YNpE=;
	b=Tpym3bYAtQXghpPm2VChbaI8JJAGyc4ylwwfKnn3PcwS94ps9gDMnScds0uq4IBsAn3w5c
	/mSs72aVYQKKkazeJg0Lf3F3rEoUQJvHkoIhiYExPc7k5FUeL0jV4I7rqdQubfcYuRBJzE
	LH5nW1i1zFpA58N0eHHUDJ6yp03SxeI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-26lifX26PTCzZZgFaDrLqQ-1; Thu,
 20 Feb 2025 22:22:06 -0500
X-MC-Unique: 26lifX26PTCzZZgFaDrLqQ-1
X-Mimecast-MFC-AGG-ID: 26lifX26PTCzZZgFaDrLqQ_1740108125
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 507C319560B5
	for <llvm@lists.linux.dev>; Fri, 21 Feb 2025 03:22:05 +0000 (UTC)
Received: from [172.64.3.45] (unknown [10.30.32.189])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EDF911800352;
	Fri, 21 Feb 2025 03:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc3,
 upstream-mainline, 33442609)
Date: Fri, 21 Feb 2025 03:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <77172.125022022220600283@us-mta-120.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: suCZb4e8pkyu5u0lLnicrrQ41TEDaeCbhzhPCA-dDYM_1740108125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-v6.14-rc' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/sre/linux-power-supply

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1681625004

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1681625004-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1681625004-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1681625004-x86_64-kernel
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

