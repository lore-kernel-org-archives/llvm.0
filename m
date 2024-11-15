Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529971E2315
	for <llvm@lists.linux.dev>; Fri, 15 Nov 2024 20:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731700929; cv=none; b=DUFTmrVfsa80wYZZe2kaZR75JPP0J8yXKX69VLw/xgZM1mlxTmHZToeQ347W1y/BL6s18lhMUhbeHxoZgmKZ1Loj7Pb5UaHUf0nsGfKKIjW5II3ewIda7zLFXSkAnwc47PQkt5sw/bsltz2hDO39j1P9kaHD5xUSnK6xpvFqJRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731700929; c=relaxed/simple;
	bh=64eWTAj7AtI03VRfRKFDJT95Mf1S2RyMWRzclcRDlac=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=k/WAWQ7Fs0wsSUdsPeZKUgjbU2vZmbLgIEIbjq5pnZOLqhys9U2GrP3XcGsa6nORqZpd17zWkOGfYWtTE3fj+eDcV1gmdt5lKqr5r4ySyRjKBEBv5+aQKNSvo9DAEH801w2YuUnv7tQSY82gWim35HUW+TBrGf8JtBKoobBV4Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JwRFNhLo; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JwRFNhLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731700927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vFF2QVeeFZVOCGnXJW9uMs0KjlluuJCWeRC1lPbNVvw=;
	b=JwRFNhLoWl5OthdKcH1dOT3wktc6iaqLQ4D/91cV458aeWxFXTiO7JdhZNDL7O1fX/05GC
	KbnpAEpJvKNYtN/kJHM7/Qle1Stv24xStfchCR9GWGqB0irnDD/DvqxiLm3lxrPiJMF43L
	6a2+wpMOGP+JrHc/w5RvTldCQ8M0+dE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-396-9K7ANlVhM9C13px-0josNw-1; Fri,
 15 Nov 2024 15:02:06 -0500
X-MC-Unique: 9K7ANlVhM9C13px-0josNw-1
X-Mimecast-MFC-AGG-ID: 9K7ANlVhM9C13px-0josNw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1E0D81955F2B
	for <llvm@lists.linux.dev>; Fri, 15 Nov 2024 20:02:05 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.34.132])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BBC7D3003B76;
	Fri, 15 Nov 2024 20:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc7,
 upstream-mainline, f868cd25)
Date: Fri, 15 Nov 2024 20:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <23230.124111515020600320@us-mta-396.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r6HCHcihCaLVcZkT6ewfFtjbRyAEXF23ArochikYLIk_1731700925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2024-11-16' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1546405088

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1546405088-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1546405088-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1546405088-x86_64-kernel-debug


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

