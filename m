Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3FB15C158
	for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 23:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742511731; cv=none; b=FGx8avRWTzUAjgZZlZY1idEzCcA/knpGzAnPBd+78KfIif0cQ+DpCOe6vT3TKp1c5299Qg29BCeTjLmFe3xxd/Sa+cDoQx4uJKXIYYB5s0mVrN0PXD4VtMcBmeYNb4CCZYIN/a2BmYE/3ZDd9IbJYoWMhPszXHN+GlzSvT5plOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742511731; c=relaxed/simple;
	bh=IIGR1twoFY0goCT7DyfHRu0N+KZat5jxB/Hr+YeycRw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=YMC/b/HuQhLQYWIBUhuZXmuAanPgWn0GWOwVRz5u7cTli82We5SteaCCTCdHTLtlygjmTFXM9ErCQPHtr6fS7d2LoOtwNkrjrV7FdELCtyQcw9imj76Y1+iy6f1+R9w4XAoY4yrB71kAA4EoUIN8oEkS4AbwoN1HGT5Qif1nJ+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DTTMI1dA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DTTMI1dA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742511728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HLuu7iACXfxKUG/q1Sc3E0KEaTbKA7VjavhEEYQ07Os=;
	b=DTTMI1dAilBcm9H9bfXwBHf0eAH1FbdWPsXalDLifTGzTTYLiJZOfa4b1vsK7RudZyrYbq
	1MMb8/FYAB8ZrGtICM5E/68xAQh1C1kYIOwUDlotlTlv2uabQEcCxN/B8Ev43waaGMe9Jp
	9gONnF4JO0E5ZWkAIJzkk6ray1eVWRw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-570-kHl2m6c-OSqNmAqlfeXUZA-1; Thu,
 20 Mar 2025 19:02:06 -0400
X-MC-Unique: kHl2m6c-OSqNmAqlfeXUZA-1
X-Mimecast-MFC-AGG-ID: kHl2m6c-OSqNmAqlfeXUZA_1742511725
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A165180AF70
	for <llvm@lists.linux.dev>; Thu, 20 Mar 2025 23:02:05 +0000 (UTC)
Received: from [172.64.12.41] (unknown [10.30.33.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 32A423001D16;
	Thu, 20 Mar 2025 23:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc7,
 upstream-mainline, b5329d5a)
Date: Thu, 20 Mar 2025 23:02:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <83562.125032019020601106@us-mta-570.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kURS7rYqH0Cui0P9Ck5-Hay7YBlOaffjbU_weynxjPo_1742511725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'vfs-6.14-final.fixes' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1727293565

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1727293565-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1727293565-x86_64-kernel
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

