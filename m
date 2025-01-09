Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BEF748D
	for <llvm@lists.linux.dev>; Thu,  9 Jan 2025 01:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736385129; cv=none; b=FJRjUEDL0hvVe88VDKnhTVyRidrEj4UFGnj4l3uEMneyglLkMtLiBFovLlzcEEwR4mFyNFzhL110QeS3xg8oMAcYB/FnAUTwoIequ7c0408r0y/k0fvuvLkbVxz+OTwOw8veiZbFIKUquPt1rIwQ6GIxvLE8Be1a5Etd/d81mgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736385129; c=relaxed/simple;
	bh=umhu5k+XDIfzoSqFo11+MLCVYw7ndjlsx7ECCuwHu1M=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=byH2hS8IXXTUjeGRYf2FdBVWVuzVLdJVn10ir83dAEYC83er4ARZP0PvVpED+CbX2swAE5s9glnxwbvBz2KrpGorxjW68/Fj/RJPP3w3evUCC7XG0n53+exXVs73BA1Z1x/qCQwUTI4nBuBPLMe/DJ7AdZNiXAoxg0KHb+ijB5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LudMPCxr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LudMPCxr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736385127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ce3JWoI096lSETmJf/F5Ret9xtMcK1kQGbPghVUgjbo=;
	b=LudMPCxrsAG+qlrLQiT22zs3gUHbcqulDl5N8RKctaKAV7ZeLyCnI4aqa4/lxTI4pQXZB7
	GxToSsAEQnNDIeZM2OWiyzUz+9hRbwfyrE6dm48OZ0KlRCh4n7DKuvYfWTgrySR19IxkIJ
	nH4uppRYdeQea8E39F/XYnIaMgJJXm8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-248-z4m6_WZkPfS0ltqtYRSeoQ-1; Wed,
 08 Jan 2025 20:12:05 -0500
X-MC-Unique: z4m6_WZkPfS0ltqtYRSeoQ-1
X-Mimecast-MFC-AGG-ID: z4m6_WZkPfS0ltqtYRSeoQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C7AA1956054
	for <llvm@lists.linux.dev>; Thu,  9 Jan 2025 01:12:04 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4A09819560AA;
	Thu,  9 Jan 2025 01:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, eea6e4b4)
Date: Thu, 09 Jan 2025 01:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <43290.125010820120500353@us-mta-248.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aupMEj2l0wheMqwNrKte3zkoknbDM_FOPN9HdcOJSV4_1736385124
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1616909788

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1616909788-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1616909788-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1616909788-x86_64-kernel
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

