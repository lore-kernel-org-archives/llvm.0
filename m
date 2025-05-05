Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0E28EC
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 00:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746404534; cv=none; b=f2HFGQ0IL7fxnSm/6vsh+AH67KfeTebpt3bBJ/XNII6443ZLXGdccTyFEl2upcGxOVRN5Gn+A9BWf5OuI6tCdto9WVpY0CvAWTyUdChJGV664BRLB0ftmiLJHxmTbdWEIAPQDQ10DlfWA/cHcTYGAc5IWSun3yEHV7lXViOmS6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746404534; c=relaxed/simple;
	bh=KdZ2skIzzAntbihevMqXJAiwKGTh/F1pAYl9HbfOIHc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kr6M4hTWDN9EaTaI5Bi5jWoBkoD35KdDfOTk6iDUP4TNK+XGzWL5rgQ8isCXdVD4K4Mob2QrzUfBH6iNShhx7Dx8xYItNwjnwccMssi9C0HluFZrUXuhjxPMR2IV6+cXxFUthCd30wxjR+BGp7shWczh/UKrJpty24NB/76cTHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LxBy3QpT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LxBy3QpT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746404531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FDyO5ELMuNs0xfF6zAGnuIgCYKNxqxZgb1wiW5Z0kNk=;
	b=LxBy3QpTiDnuEHVQdbN2WZeiHe1WL+Zz2xwRVQPYwizYFnlpgh3RfD6GswOLBeJ4BVhxCp
	qPJrfhBvuiQyXhBgeAl7VZ4XgQrzRNT/QPxtvelVWSYpCMyjbQbmTHIYw8yhJHbE0F8bgY
	EjLWACILGwVOeqLXtzxl2xAyit1tNdQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-341-wIl1CdocPD6T2hZq9hAkig-1; Sun,
 04 May 2025 20:22:08 -0400
X-MC-Unique: wIl1CdocPD6T2hZq9hAkig-1
X-Mimecast-MFC-AGG-ID: wIl1CdocPD6T2hZq9hAkig_1746404526
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25D0719560AE
	for <llvm@lists.linux.dev>; Mon,  5 May 2025 00:22:06 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A9C9E1956096;
	Mon,  5 May 2025 00:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc5,
 upstream-mainline, 92a09c47)
Date: Mon, 05 May 2025 00:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <00920.125050420220800289@us-mta-341.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kr8Bd-5pg6O5Mcx9q-fSJr19RJQIM2wvkORbnYhW9wM_1746404526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.15-rc5

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1799695672

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1799695672-x86_64-kernel-debug


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

