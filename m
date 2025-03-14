Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7272746C
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 03:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741923130; cv=none; b=fVxQQG6k/3HWnzIirurdlOzF5kmC8zb0lklsVYMYM2MR5Ta/+Vpt7nYue1b7V4OpWkqSKHtFSbUDgBU4XWE7ozjft1Osn6aQq5SK/MF59BLCeD7fe8//nuLaQIBocZ7re4bIEHtKYJpLMXdZ7SfgJuoqYxII3cR2fY3k+NTkyv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741923130; c=relaxed/simple;
	bh=ATv45ekYUVXsGAK/EFNvQjZACYmMg7GfRfBEJv/eUS0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MzHgwXq5yGWMvv9RRImGCsVFJwO85MgGY8HlbiiRj4syk9M/ctfzvy7HDTgDfReZVRGZxXMqRz4ed615iuN2ybRRrxbaOwtnnkZU0Da5sYAFODDiGFXrIop0y7sbmifVufBr+2g5i/F3GxrjpbcZBev3snJOO89LP60hB8BMslQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6fVcP0l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6fVcP0l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741923127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iuOoLc1kRRXdtTTANM29eC3SaztmpcebAy1b1BBpbco=;
	b=a6fVcP0l5oYCYMj0X80hv6A3GRTMYL/w0i4TBBSSKIyC97X/veFf0YFqyfij6UHYOWP4rK
	Rw3Hb4ptNj7hvd1jVT7WrFQUuAJTFLcyzqPXAdBwWy3Q7WMzWLpZ0vsfolrPhsFAZFb2BY
	zpO3hCBCWT7vR2XdYFQzFN/bKxuJxvQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-ZPzG2lovM_2_KdOs4lIgYw-1; Thu,
 13 Mar 2025 23:32:05 -0400
X-MC-Unique: ZPzG2lovM_2_KdOs4lIgYw-1
X-Mimecast-MFC-AGG-ID: ZPzG2lovM_2_KdOs4lIgYw_1741923125
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D87B2195608F
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 03:32:04 +0000 (UTC)
Received: from [172.64.0.42] (unknown [10.30.32.80])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82B9819560AB;
	Fri, 14 Mar 2025 03:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc6,
 upstream-mainline, e3a854b5)
Date: Fri, 14 Mar 2025 03:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <32283.125031323320500175@us-mta-17.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U4IxkgVry-JUv5G6FJua0yBIu-K78uSHO0TX7lud_4o_1741923125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'clk-fixes-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1716122085

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1716122085-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1716122085-x86_64-kernel
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

