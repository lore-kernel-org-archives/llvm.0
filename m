Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353A72F3B
	for <llvm@lists.linux.dev>; Sun,  2 Feb 2025 22:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738533730; cv=none; b=GryD/BZ2psb9U/looQlQVENOrgwsAJ/DhNEdqBkJiieUUU7xrcyz61zO6UcY1jt7qy+2OUqkQLxW1KOA2MLQPeNIaj/ySD6yQuk0m76ATmbDqbPh5b1mPU8xwO9xK+dPy3UxF1P+Q8CsHovNcWnsyu0KDqOnvMRVUmRDcOBA4EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738533730; c=relaxed/simple;
	bh=LDMP5ocCv2b54z5FTYdsobd086+fSbNWjE/7NKeVz1A=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fonjBg/gheG9u4bQakEmwR2taygGrDE2PdD9ptyfJFYZe6+VRq/S5selQZ6EBJFeLg82gI1PHxRnApS9uPMYly57Lc1ytMaN1i5YQKVP8Af1MzS/9kyi3okTTarAj792nO2aBJxJk9y16CJb8zfd+vx0pPVjAItzcZf9mU4Ll0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZXRcodMt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZXRcodMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738533727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m9jqbI58z8lbBCxnvnDR2lkGVJF04t11LqC30Ok4LBg=;
	b=ZXRcodMtABjddIsjkKB2/6LS0RmedrYnNUNLmSmSmhK5fC/Z6NSPGa20j392wohSbngXMB
	7bY1jlXKszTUG+dbM5inWzXbtndJ7m6qrEyFGdLDan+RMcvIzjI6vdnydCWQskKPB3XNSV
	2dvQ3987XckB5NcXvGgOjk4sn/N2d60=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-278-QK2KLe8KNjOPyISNr3Pfjg-1; Sun,
 02 Feb 2025 17:02:03 -0500
X-MC-Unique: QK2KLe8KNjOPyISNr3Pfjg-1
X-Mimecast-MFC-AGG-ID: QK2KLe8KNjOPyISNr3Pfjg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 020B418004A9
	for <llvm@lists.linux.dev>; Sun,  2 Feb 2025 22:02:03 +0000 (UTC)
Received: from [172.64.3.40] (unknown [10.30.32.189])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9098D1956094;
	Sun,  2 Feb 2025 22:02:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, d79bc8f7)
Date: Sun, 02 Feb 2025 22:02:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <41725.125020217020301129@us-mta-278.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 76UrfRpaa9NuNiUoziho66qUG83Ly9tGpLAyP0kUwYk_1738533723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'turbostat-2025.02.02' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/lenb/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1652291603

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1652291603-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1652291603-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1652291603-x86_64-kernel
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

