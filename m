Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C41A6D38
	for <llvm@lists.linux.dev>; Thu, 19 Aug 2021 13:25:51 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id l3so4515376qtk.10
        for <llvm@lists.linux.dev>; Thu, 19 Aug 2021 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=afjAy7aSxYkhGKeMt7qmlsAs+GUTzcqSdbomPjY+EF0=;
        b=bXWLULKAbtNvFrW5/ydHe7u/WwgzrGfJ/nNMU0FTrODjvupdCkg+NK2LjI+aiXeYWy
         JJBsNgOGYRU2FRSTiYcFXfv1fKdyThrTnOg+/1nrzPKILi6Vpqd+/HWhqFzWciGhTp25
         I3KwHHpae7/AbcrdWD1RXkJ3T0N+kFlS+PTLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=afjAy7aSxYkhGKeMt7qmlsAs+GUTzcqSdbomPjY+EF0=;
        b=NGm0HsEx10zpHUt8n7lEeoP733Q9HesY/oKQgfhFjFebOKmEGnwHck9qwo/TWXIeo6
         UjNXqzoflEJVB0s48Dd0/yf16OSEAW72fZcOWUfm4U8x7y4g9xtsRIidFmLb7O8LWsqR
         xCTDtegM8tuQ5LoFnonh5JvwzwSC0BCG9JdL5YxOD67bsHmV/PHAzZMLfi7LUtz1yit1
         RmEv6EM6atM/LP9vhImGHRiiAnjm5HZZKswBkEOeZqmI0rEqIu6YCdUm7V+qgIhKt9AO
         DYGMjmQBrxgxVb46Dl5ekuwDJwl8gDrlHgVTjV2uepww2C/z8IRjZnx2gDZPTNistQcn
         vKTw==
X-Gm-Message-State: AOAM533qTxq/d6P49Nj9qrRmUB9jigFSi/P2i7cNmDMTB4SLphrq+j/6
	3KSIM1AlhRxCmWUc8eORfnof6hUrgJwmDbQg
X-Google-Smtp-Source: ABdhPJxcZrZVzCL3s78qBoeIHXleTP0c8zxPZNfRVrb+RWm4bbf6wopVv8pO56Jf2rBaiF0aXl5tAw==
X-Received: by 2002:a05:622a:289:: with SMTP id z9mr12509275qtw.67.1629379549920;
        Thu, 19 Aug 2021 06:25:49 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id g131sm1627542qke.122.2021.08.19.06.25.49
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 06:25:49 -0700 (PDT)
Date: Thu, 19 Aug 2021 09:25:47 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: llvm@lists.linux.dev
Subject: Test message to start the archive
Message-ID: <20210819132547.sellxg45jzb4rkp3@nitro.local>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

This is a test message to initiate the public-inbox archive.

-K
