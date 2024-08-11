Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BF215C150
	for <llvm@lists.linux.dev>; Sun, 11 Aug 2024 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723414390; cv=none; b=LsWKdvx4M4OfdCGX+CGiz1aCxQWvqAberC3km0GIgigvNyrbz3alFAeT6E9VpwC1kwzz0U02UVsfYwcv5ntTkO+RitF0ViEIdVSy4k/Cv+KCOehcc39agGTg9aJzLRX/I9e68+5R4nHfDalJcBKIaIPoWSlrv9pyChmxA+SyGh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723414390; c=relaxed/simple;
	bh=cg37E39F5sYsBa5xKFhvc4YfllCtK5Ts0CZbu/Sxuag=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=aj6t9Rx04t0xarSBlXlWOFwn77Uhqk5Om3MDV4mEPowWUUCgGGFVb1gl5CFEuW5vagmedBZX+uwq+/kPLlBuU0TqFrxYM8upt0VFYXDnr58W+6/5LhZhk41ZvlJ9Ru/3SflQIc2fWqwiuj6lf3M7cqB0D7ZrT8EG+TOLmtG8x8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hj0f6eXh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hj0f6eXh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723414387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4LwGqFihyV1M5DRt2vYziRY0aXLmd1hANu0SRG6nMrg=;
	b=hj0f6eXh6xprd75ZG9FQXt5gK8tBqZTZP+2GZKmw+oXAtURn98MpZz24Zd189XhkKOb9ZJ
	suDVaR2ttFmKsS76PD/UV8RItxt6gZO5rNrmb6xCvvg2giKGtoFNsiIYH5E0r4nph4UAkm
	zsMMugxEJPw4yT39f4jI4E6wBYyJqJE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-79pY7gOQOCuvUiL5OM09mQ-1; Sun,
 11 Aug 2024 18:13:03 -0400
X-MC-Unique: 79pY7gOQOCuvUiL5OM09mQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EBB4C18EB22C
	for <llvm@lists.linux.dev>; Sun, 11 Aug 2024 22:13:02 +0000 (UTC)
Received: from [172.64.0.80] (unknown [10.30.33.131])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7727E30001A1;
	Sun, 11 Aug 2024 22:13:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc2,
 mainline.kernel.org-clang, 7006fe2f)
Date: Sun, 11 Aug 2024 22:13:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <33358.124081118130300241@us-mta-302.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'x86-urgent-2024-08-11' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1408997390

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1408997390-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1408997390-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1408997390-x86_64-kernel-debug


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

