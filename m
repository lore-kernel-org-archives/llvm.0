Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1B367A0D
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360096; cv=none; b=rq7B5Z9VmnHML6+CvZJfxz5PDLo6OhMY8gNEdDF6XMFrCn57e4oktm9Kw9OfRjKUbcLjK5kY4ODZkeURlQXuXlEPl4727Gl9qgl265eiqSE9+Ja06A/rQ3vrbe5tJYqOvUtVxb8Z90Jmd5Ie76AROwWAEiar32/2p7qIsybvGkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360096; c=relaxed/simple;
	bh=FVsv6BL0t93JlYFXCvgAp8ib4QQz2ZwsB2/0uMtERr4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=AD2KXAOiryoYgA5gszpqKfG/AJnGaJJW+Ttb6UhNSyD2BdjZp0pud7ikfaZSjZBl7o7fFx7iqni53xk547Z5bdszeG1JGY16tOlJaubyAJBHgt2YADtliQkOd2bRKlm84I0791G41BpKGo1MCLSBizbqdvGTw8Pm9J5oeTidVNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fs0ME5Sh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fs0ME5Sh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YEV8/J9FTK1f8+BZZ6PRlZDY5FT9VD+thQNFVn+akj4=;
	b=fs0ME5Sh0J25D0TfkLb9sRRREPUQ3eIkdTTy2tvholJE2XfjJatdCU0rMm0ymiYIK/2Ufj
	Hpyfe/STcHxeKl5UJU7iMVfM8o7xokjGW5IKH2RBQZxmqQ77GOPXA7TulqQXYlgTczRIOz
	qFFmJHsz+VRMAg85Wip5Lh9iJ53ySmg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-157-XeV9KHinP-aczg53Zcaxrw-1; Thu,
 26 Sep 2024 10:14:51 -0400
X-MC-Unique: XeV9KHinP-aczg53Zcaxrw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D0241944A88
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:50 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3557F1955DCA;
	Thu, 26 Sep 2024 14:14:50 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, a940d9a4)
Date: Thu, 26 Sep 2024 14:14:50 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <87815.124092610145100319@us-mta-157.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'soc-arm-6.12' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/soc/soc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1456608708

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1456608708-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1456608708-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1456608708-x86_64-kernel-debug


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

