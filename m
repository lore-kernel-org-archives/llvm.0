Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698D91C687
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360068; cv=none; b=H3wasVoQI2kiV/UF732XYqxDj3XL8Ek78uSHDTjFPBEUtUZBNa2XFB+S7MD+rGYCHNvE4WS82sM2M8mL95+uE3j/TN3Fd1Vu5I1TsQui9D4DrOBHmcRR8srxw3UHuQlYDMmbgzFuTZSRtLsEbzXaEM/I1GNpa8TISVG0z76aZcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360068; c=relaxed/simple;
	bh=hP9lsu8qGWwHBdZ2TMoBctMAh5jp/iIh5/Bv0E0Wdso=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mMog8IHm3Yyfs5X+An5tChJdXLp/FZoNhWY1ND4KSr4+zP3kGN7FYDaaTSVSABlr5Wp+7i11URN4hpp/UC4R2pgTK00FIK7Q6qzI/fxZENZVz39+ggOnXTY2BUERwU8UP2GU4OgR+6D88Qv9mI0fVNxrp5G7yp9pZsek3zL0Dz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=efMfcqME; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="efMfcqME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=naggJBBVNQ5ijYMn6PR4Bo6BtN6iU068iHijZwpLVj4=;
	b=efMfcqMEklGEGWK80OurAYDEMWLjBsdjSyYKDZDHzc3FO/c17MdqepysetkG2Oj4YsgW6i
	jNweHGhrej23jw/IW2fHl2TsrCeNsI6PvdD13n1ANojg1oB764lBqTOcSdJ5uVxqUIvA82
	uREE5LB/9P/zIAqpbXklUWVpB/xOjqQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-610-NHY_7XUVOVaect-qkS-UgA-1; Thu,
 26 Sep 2024 10:14:25 -0400
X-MC-Unique: NHY_7XUVOVaect-qkS-UgA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A57A197731A
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:24 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 072691955DC8;
	Thu, 26 Sep 2024 14:14:23 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, de848da1)
Date: Thu, 26 Sep 2024 14:14:23 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <08156.124092610142500864@us-mta-610.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-next-2024-09-19' of https://gitlab.freed=
esktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1460185019

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1460185019-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1460185019-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1460185019-x86_64-kernel-debug


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

