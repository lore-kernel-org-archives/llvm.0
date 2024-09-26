Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCFE13632B
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727359989; cv=none; b=g//cmvpSfPBz788z51qkGP7JKf0u3/eHeqRHg6takR+CXqKU2uZ8jaem75r21uZuFKqwLbLitUoRVz6m9hWCKg+rirjCEgoHM4jM9F5LNA1/AyPpIMsD6/Fyln/U65adCnj3f/kJjGYo0Gl0sUZov3/TAunhUvdbX0hrY/ojzSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727359989; c=relaxed/simple;
	bh=WMAuC6AO/xm8qgqKwQyJLK95jTanWnqY3Xukj1XpGGo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=VFyd06kRcC8ZQSAEeVoaUmdCeTcsEadO1lakgJYPCexyaeeA8CQcv1FSEU+2oWOP0TntpUZKfxJHXf7ODavOSJ4k6sjo/7YzAdG3CjgXjS4Bc0HEJ0b7sOQtHlcwu0K/dyCDsqkcXV5Hu0bnR/f9yGOyTBQ+hDRRsQVst0rrDqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SEXJxapR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SEXJxapR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727359987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8xG4Mot34nxgjheMW4pgq2uc1gCzXkVEI4TR1lzyD94=;
	b=SEXJxapRsSPxGnyJeNrSxCHiu2gPz2Jwh3pS8wPpqtnKbUDDOrozRugz0evV2hp8KTe3k3
	lLnTNu1DS9e9xboVXNPDvMaW238yzbKHcqkvMgT7W0DcRl4OTLCk7Jw5xWDK55t+dzYcg/
	UrlW72U/zF4iDDr0xikGs24TBTjsZxs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-WRQh0VE7Pxy5LysaYDvOgA-1; Thu,
 26 Sep 2024 10:13:05 -0400
X-MC-Unique: WRQh0VE7Pxy5LysaYDvOgA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 12EB0196E0AB
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:13:05 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 978491979060;
	Thu, 26 Sep 2024 14:13:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, aa486552)
Date: Thu, 26 Sep 2024 14:13:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <10215.124092610130502609@us-mta-195.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'memblock-v6.12-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/rppt/memblock

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1469490062

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1469490062-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1469490062-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1469490062-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1469490062-x86_64-kernel-debug


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

