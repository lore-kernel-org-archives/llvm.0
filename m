Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D392E3362
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 23:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995189; cv=none; b=YgqNtu8ji4PcYW+b5UJkeFa8jWa6Rw62YDcn+b2m6Dy0kV7DzjFLUcdVPrlEfSht5Tl3S65PQ0GWZv+5Z/3LXZK3iARtKw2T4uTlk7skZQjLAbvXEdqjBb+iOfQIc/Ynd8Z+OttOJrT9seFQiIlLw63dR/usD5nPnKdvx+VxUec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995189; c=relaxed/simple;
	bh=4eEKOD4vGbC7AtsWU2nGzeEgmU2TSrkJfrtEKfJu0+Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NWwE6Tlb7WvZh++FeWM2J85S52FzL3wX8t6/WxTA6IYYiDzu54v1bWzpV4T7Zs9zaEiZMJgJpBG1QSKCZdfGuIQJfdAUfsiLcgIP5iDu9aLYYC3NQQysC/V3idl/s8/JQEee9i+4rTWrORJ7RTfrXA2MLNqKoFCcbwx31l6qzco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VuMlo8J8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VuMlo8J8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741995186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bhVWyjYIgk70dqq62jows5uX0owpzTu48kDM8XzTtwU=;
	b=VuMlo8J86i3qx8+9xPFpTwPL4R5kGdAQ8UFAGIysU+pEPr674rMX46mIY8oniqYAiPxBrk
	GQdqlLcC/zLJR+3rN2yWyhEtE6UrtoKPGupefsmkyQFTCks4D3RANkt30sbd9CGuGJj+Yq
	pnmgfkbo+Xhnv6wQqiZcvfhj52kTS7w=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-396-Pzh9udzyMW6qUgZnfGZNww-1; Fri,
 14 Mar 2025 19:33:05 -0400
X-MC-Unique: Pzh9udzyMW6qUgZnfGZNww-1
X-Mimecast-MFC-AGG-ID: Pzh9udzyMW6qUgZnfGZNww_1741995184
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25DBC1956048
	for <llvm@lists.linux.dev>; Fri, 14 Mar 2025 23:33:04 +0000 (UTC)
Received: from [172.64.0.42] (unknown [10.30.32.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C84C1944E42;
	Fri, 14 Mar 2025 23:33:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc6,
 upstream-mainline, b35233e7)
Date: Fri, 14 Mar 2025 23:33:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <81908.125031419330500120@us-mta-396.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uFHm7oDMZHnUMvOIfbaUdoWe159tkFvUq_FcVx7dpVE_1741995184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.14/dm-fixes-2' of git://git.kernel.org=
/pub/scm/linux/kernel/git/device-mapper/linux-dm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1717798465

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1717798465-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1717798465-x86_64-kernel
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

