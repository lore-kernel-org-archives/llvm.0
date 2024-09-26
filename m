Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A126352F88
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727361085; cv=none; b=qsgwIx51JXAgrUROfqXxlK2xT0Faamf+zEk6GjJmN3s0RvE+zMU0E9Qe+YzF2jDOfS1A1qae/WRnDm73/akuOadSW4gU/Tw7t7S4qy8giR31A8gRkXh8wWtXx0PzsSAx3l1aiffxgDnNifSQDvB4OSFXggH+c1KGNv4yJW3penk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727361085; c=relaxed/simple;
	bh=v5L1YcdwTtROtaIhHK37TXprMhKFSpLSEPhuLvgMoUU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ixv7+O/Wv1heLxzarNMoYqvf/h82bxzOH3qIGb6Wb+D2NgCOdCOU1cMHLCYSnh8J4xjsbzyCa2F2vetzOyce0pRdAG8bG10OaxxWGc780LOWeKPqipIV6U7gyYg0ynVbZxuR50cySix5igYINuLAkTO9rGu/iQNrL8UBwLrEjpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZdW9Az+h; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZdW9Az+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727361082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BYL4aZeoEHeugbToCg129of4pHcLal0TFxdlkQv9VnM=;
	b=ZdW9Az+h+97ZnBSoAo+Wk0bVuecJRhK9f7trfGF06GEieeoYRWTczz4L+hr/xov6JqkUR5
	nCByGVMPQVziRUurOIoVtmNaEYZdtcR4Qk6bCUpyKVQQfK01AFrcvSjsBzojHmJVqtXOv6
	o1Bn7CmEnWXkDSEgZo666Qnr7zC0ABo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-652-jGdGwUYNP8evMhwzaUdaSw-1; Thu,
 26 Sep 2024 10:31:21 -0400
X-MC-Unique: jGdGwUYNP8evMhwzaUdaSw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2D391936CF0
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:31:20 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45FB91979064;
	Thu, 26 Sep 2024 14:31:20 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc5,
 mainline.kernel.org-clang, e8784b0a)
Date: Thu, 26 Sep 2024 14:31:20 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <29472.124092610312101497@us-mta-652.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'usb-6.11-rc6' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/gregkh/usb

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1434779088

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1434779088-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1434779088-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1434779088-x86_64-kernel-debug


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

