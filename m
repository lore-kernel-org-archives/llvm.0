Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AB8145FE0
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 05:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737522732; cv=none; b=cqx8frTIw2umoMilPsiN85Y5CHQMbAn0XCkdJ4qBenObx9XlQwm0o+GPvtb5pYw1SB/OwePdzIGMg+sO7a1kDuY1+dEcoCBjSUriWF1hVYRgu2cZ4fyjcSuJoGs2gm8pBkeRfjZMmspdfUdSng7u/F2OPptOWQrYr1Zin+k6sSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737522732; c=relaxed/simple;
	bh=f0VfubwrxPXSeJv5iYcF7xOS+x7hsMhB+CMkjrDCd+k=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=YXTHpvLTTZE+7Xbas2wmFeS2LFSL8rxAd0Vwkj1IRF7YW8jCqmv1qqb9hs3eRY3A9MXREGuPbWYgIGI5SRVNvqKTBHrzI+pOrzzkK+4dKZeFXMO33Ak/RyNdvJtT67+MZpRwtudKArKh//PdMTUvMRXu4rdgEnlSLmxxbUS6cBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MRsYxB1D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MRsYxB1D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737522729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=laUTo8F85OeDsorTzlg50yU8vly/eOROINB93ZjxtrU=;
	b=MRsYxB1Dz5pyd8OT1LA+4/jEP2LaU1r2aJlgVswU0itRMLiO7QsapoJ801iVL90OOPYoWe
	aPSpt3m4UE3mIdSRJlRWOiW5Ce8PUFM5cOkSQR9V07XKwWFHpuxJscSz7hyoQQ+nAUOnsB
	aOMdT06fbmipj1VLHki2vBlcL1ngs3I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-sAuqfPUgOpiQbSpy4LwUkw-1; Wed,
 22 Jan 2025 00:12:06 -0500
X-MC-Unique: sAuqfPUgOpiQbSpy4LwUkw-1
X-Mimecast-MFC-AGG-ID: sAuqfPUgOpiQbSpy4LwUkw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F39C19560BB
	for <llvm@lists.linux.dev>; Wed, 22 Jan 2025 05:12:05 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C17093003E7F;
	Wed, 22 Jan 2025 05:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, b394eabd)
Date: Wed, 22 Jan 2025 05:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <26284.125012200120600189@us-mta-303.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kJVd_7A2XamR5IudwV7bOeJahF4uod3bofJxNJDgni8_1737522725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'chrome-platform-v6.14' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/chrome-platform/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1635304921

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1635304921-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1635304921-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1635304921-x86_64-kernel
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

